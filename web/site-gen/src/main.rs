mod parse;
mod template;

use std::fs;
use std::path::{Path, PathBuf};

use parse::Exercise;

fn main() {
    // This binary is always run via `cargo run -p site-gen` from the
    // `web/` workspace, so paths are resolved relative to this crate's
    // manifest directory rather than the current working directory.
    let manifest_dir = Path::new(env!("CARGO_MANIFEST_DIR"));
    let web_dir = manifest_dir.parent().expect("web dir");
    let repo_root = web_dir.parent().expect("repo root");
    let dist_dir = web_dir.join("dist");
    let assets_src_dir = web_dir.join("assets");
    let exercises_dir = repo_root.join("exercises");

    let mut categories: Vec<PathBuf> = fs::read_dir(&exercises_dir)
        .unwrap_or_else(|e| panic!("reading {}: {e}", exercises_dir.display()))
        .filter_map(|entry| entry.ok())
        .map(|entry| entry.path())
        .filter(|path| path.is_dir())
        .collect();
    categories.sort();

    let mut by_category = Vec::new();

    for category_dir in categories {
        let category = category_dir
            .file_name()
            .and_then(|n| n.to_str())
            .expect("category dir name")
            .to_string();

        let mut numbered_files: Vec<(u32, PathBuf)> = fs::read_dir(&category_dir)
            .unwrap_or_else(|e| panic!("reading {}: {e}", category_dir.display()))
            .filter_map(|entry| entry.ok())
            .map(|entry| entry.path())
            .filter(|path| path.extension().is_some_and(|ext| ext == "ua"))
            .filter_map(|path| {
                let num: u32 = path.file_stem()?.to_str()?.parse().ok()?;
                Some((num, path))
            })
            .collect();
        numbered_files.sort_by_key(|(num, _)| *num);

        let mut exercises = Vec::new();
        for (num, path) in numbered_files {
            let content = fs::read_to_string(&path)
                .unwrap_or_else(|e| panic!("reading {}: {e}", path.display()));
            match parse::parse(&content) {
                Some(exercise) => exercises.push((num.to_string(), exercise)),
                None => eprintln!("skipping {} (not a recognized exercise file)", path.display()),
            }
        }

        if !exercises.is_empty() {
            by_category.push((category, exercises));
        }
    }

    write_site(&dist_dir, &assets_src_dir, &by_category);

    let total: usize = by_category.iter().map(|(_, ex)| ex.len()).sum();
    println!("Generated {total} exercise page(s) into {}", dist_dir.display());
}

fn write_site(
    dist_dir: &Path,
    assets_src_dir: &Path,
    by_category: &[(String, Vec<(String, Exercise)>)],
) {
    // Re-create each category's output directory so stale pages (e.g. for a
    // removed exercise) don't linger, while leaving `assets/` alone: the
    // WASM runner is built and placed there by a separate build step.
    for (category, _) in by_category {
        let category_dir = dist_dir.join(category);
        if category_dir.is_dir() {
            fs::remove_dir_all(&category_dir).expect("clear stale category dir");
        }
        fs::create_dir_all(&category_dir).expect("create category dir");
    }
    fs::create_dir_all(dist_dir.join("assets")).expect("create assets dir");

    fs::write(dist_dir.join("index.html"), template::render_index(by_category))
        .expect("write index.html");

    for (category, exercises) in by_category {
        for (num, exercise) in exercises {
            let page = template::render_exercise(exercise);
            fs::write(dist_dir.join(category).join(format!("{num}.html")), page)
                .expect("write exercise page");
        }
    }

    for asset in ["style.css", "app.js"] {
        let src = assets_src_dir.join(asset);
        let dst = dist_dir.join("assets").join(asset);
        fs::copy(&src, &dst).unwrap_or_else(|e| panic!("copying {}: {e}", src.display()));
    }
}
