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

    fs::create_dir_all(dist_dir.join("assets/fonts")).expect("create fonts dir");
    let mut font_hash = String::new();
    for font_file in ["Uiua386.ttf", "LICENSE.txt"] {
        let src = assets_src_dir.join("fonts").join(font_file);
        fs::copy(&src, dist_dir.join("assets/fonts").join(font_file))
            .unwrap_or_else(|e| panic!("copying {}: {e}", src.display()));
        if font_file == "Uiua386.ttf" {
            font_hash = hash_bytes(&fs::read(&src).expect("read font"));
        }
    }

    let style_src = assets_src_dir.join("style.css");
    let style = fs::read_to_string(&style_src)
        .unwrap_or_else(|e| panic!("reading {}: {e}", style_src.display()))
        .replace("FONT_HASH", &font_hash);
    fs::write(dist_dir.join("assets/style.css"), &style).expect("write style.css");

    let app_src = assets_src_dir.join("app.js");
    let runner_hash = runner_hash(&dist_dir.join("assets"));
    let app = fs::read_to_string(&app_src)
        .unwrap_or_else(|e| panic!("reading {}: {e}", app_src.display()))
        .replace("RUNNER_HASH", &runner_hash);
    fs::write(dist_dir.join("assets/app.js"), &app).expect("write app.js");

    // Version the asset URLs in the pages too, so a changed asset is
    // refetched instead of served from the browser cache.
    let versioned = |page: String| {
        page.replace(
            "/assets/style.css\"",
            &format!("/assets/style.css?v={}\"", hash_bytes(style.as_bytes())),
        )
        .replace(
            "/assets/fonts/Uiua386.ttf\"",
            &format!("/assets/fonts/Uiua386.ttf?v={font_hash}\""),
        )
        .replace(
            "/assets/runner.js\"",
            &format!("/assets/runner.js?v={runner_hash}\""),
        )
        .replace(
            "/assets/runner_bg.wasm\"",
            &format!("/assets/runner_bg.wasm?v={runner_hash}\""),
        )
        .replace(
            "/assets/app.js\"",
            &format!("/assets/app.js?v={}\"", hash_bytes(app.as_bytes())),
        )
    };

    fs::write(dist_dir.join("index.html"), versioned(template::render_index(by_category)))
        .expect("write index.html");

    for (category, exercises) in by_category {
        for (num, exercise) in exercises {
            let page = versioned(template::render_exercise(by_category, category, num, exercise));
            fs::write(dist_dir.join(category).join(format!("{num}.html")), page)
                .expect("write exercise page");
        }
    }
}

/// Content hash (FNV-1a, hex), used to bust the browser cache when a file
/// changes.
fn hash_bytes(bytes: &[u8]) -> String {
    format!("{:016x}", fnv1a(0xcbf29ce484222325, bytes))
}

fn fnv1a(mut hash: u64, bytes: &[u8]) -> u64 {
    for &byte in bytes {
        hash = (hash ^ u64::from(byte)).wrapping_mul(0x100000001b3);
    }
    hash
}

/// Hash of the built runner files.
fn runner_hash(assets_dir: &Path) -> String {
    let mut hash = 0xcbf29ce484222325;
    for name in ["runner.js", "runner_bg.wasm"] {
        let path = assets_dir.join(name);
        let bytes = fs::read(&path).unwrap_or_else(|e| panic!("reading {}: {e}", path.display()));
        hash = fnv1a(hash, &bytes);
    }
    format!("{hash:016x}")
}
