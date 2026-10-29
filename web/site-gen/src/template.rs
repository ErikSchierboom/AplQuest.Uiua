//! Renders the parsed exercise data into static HTML pages.

use serde::Serialize;

use crate::parse::Exercise;

#[derive(Serialize)]
struct TestCaseJson<'a> {
    description: Option<&'a str>,
    code: &'a str,
}

type Categories = [(String, Vec<(String, Exercise)>)];

/// Common page chrome shared by every generated page: a left-hand accordion
/// menu (one `<details>` per category) next to the page content.
///
/// `asset_prefix` is the relative path back to the site root (e.g. `"."` for
/// the top-level index, `".."` for exercise pages one directory deep), so the
/// generated site works from any static host or `file://` root without
/// hardcoded absolute paths. `current` is the `(category, number)` of the page
/// being rendered, if any; its category starts expanded.
fn page_shell(
    title: &str,
    asset_prefix: &str,
    categories: &Categories,
    current: Option<(&str, &str)>,
    body: &str,
) -> String {
    let menu = render_menu(categories, asset_prefix, current);
    format!(
        r#"<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{title}</title>
<link rel="stylesheet" href="{asset_prefix}/assets/style.css">
</head>
<body>
<div class="layout">
{menu}<main class="content">
{body}
<footer class="attribution">
<p>The problems and tests are adapted from
<a href="https://apl.quest">APL Quest</a>
(<a href="https://github.com/Dyalog/apl.quest">Dyalog/apl.quest</a>), licensed under
<a href="https://creativecommons.org/licenses/by-nc-sa/4.0/">CC BY-NC-SA 4.0</a>.</p>
</footer>
</main>
</div>
</body>
</html>
"#
    )
}

/// Render the side menu: one accordion section per category. Sections share a
/// `name`, so browsers keep at most one open at a time.
fn render_menu(categories: &Categories, prefix: &str, current: Option<(&str, &str)>) -> String {
    let mut menu = format!(
        "<nav class=\"sidebar\" aria-label=\"Exercises\">\n<a class=\"site-title\" href=\"{prefix}/index.html\">APL Quest in Uiua</a>\n"
    );
    for (category, exercises) in categories {
        let is_current = current.is_some_and(|(c, _)| c == category);
        let open = if is_current { " open" } else { "" };
        menu.push_str(&format!(
            "<details class=\"accordion\" name=\"years\"{open}>\n<summary>{category}</summary>\n<ul>\n"
        ));
        for (num, exercise) in exercises {
            let aria = if current == Some((category.as_str(), num.as_str())) {
                " aria-current=\"page\""
            } else {
                ""
            };
            menu.push_str(&format!(
                "<li><a href=\"{prefix}/{category}/{num}.html\"{aria}>{}</a></li>\n",
                html_escape(&exercise.title)
            ));
        }
        menu.push_str("</ul>\n</details>\n");
    }
    menu.push_str("</nav>\n");
    menu
}

/// Render the top-level index page.
pub fn render_index(categories: &Categories) -> String {
    let body = "<header class=\"site-header\">\n\
<h1>APL Quest in Uiua</h1>\n\
<p>Solve each exercise by writing <a href=\"https://www.uiua.org/\">Uiua</a> code \
in the browser, then check it against the exercise's own tests.</p>\n\
<p>Pick a year from the menu to see its exercises.</p>\n\
</header>\n";

    page_shell("APL Quest in Uiua", ".", categories, None, body)
}

/// Render a single exercise page.
/// Whether a description line is part of a diagram or table (as opposed to
/// prose): it uses box-drawing characters or tabs, is indented, or is a
/// table row (starts with `|`).
fn is_preformatted(line: &str) -> bool {
    line.contains('\t')
        || line.starts_with("  ")
        || line.starts_with('|')
        || line.chars().any(|c| ('\u{2500}'..='\u{257f}').contains(&c))
}

/// Render description lines as paragraphs, with runs of preformatted lines
/// (diagrams) kept verbatim in a `<pre>` block.
fn render_description(lines: &[String]) -> String {
    let mut html = String::new();
    let mut i = 0;
    while i < lines.len() {
        let line = &lines[i];
        if is_preformatted(line) {
            let end = lines[i..]
                .iter()
                .position(|l| !is_preformatted(l))
                .map_or(lines.len(), |n| i + n);
            let block = &lines[i..end];
            let indent = block
                .iter()
                .map(|l| l.len() - l.trim_start_matches(' ').len())
                .min()
                .unwrap_or(0);
            let text: Vec<String> = block.iter().map(|l| html_escape(&l[indent..])).collect();
            html.push_str(&format!("<pre class=\"diagram\">{}</pre>\n", text.join("\n")));
            i = end;
        } else {
            if !line.is_empty() {
                html.push_str(&format!("<p>{}</p>\n", html_escape(line)));
            }
            i += 1;
        }
    }
    html
}

pub fn render_exercise(
    categories: &Categories,
    category: &str,
    num: &str,
    exercise: &Exercise,
) -> String {
    let description = render_description(&exercise.description);

    let tests: Vec<TestCaseJson> = exercise
        .tests
        .iter()
        .map(|t| TestCaseJson {
            description: t.description.as_deref(),
            code: &t.code,
        })
        .collect();
    let tests_json = serde_json::to_string(&tests)
        .expect("test cases serialize")
        .replace("</", "<\\/");

    let body = format!(
        r#"<header>
<h1>{title}</h1>
{description}</header>
<section class="examples">
<h2>Examples</h2>
<div id="results" class="results"></div>
</section>
<section class="editor">
<h2>Implementation</h2>
<div class="code-editor">
<pre class="code-highlight" aria-hidden="true"><code id="code-highlight"></code></pre>
<textarea id="code" spellcheck="false" autocapitalize="off" autocomplete="off" autocorrect="off" placeholder="Enter your code"></textarea>
</div>
<div class="actions">
<button id="run">Run tests</button>
<span id="status"></span>
<span class="shortcut-hint">You can also run the tests via ⌘/shift + enter</span>
</div>
</section>
<script type="application/json" id="tests-data">{tests_json}</script>
<script type="module" src="../assets/app.js"></script>
"#,
        title = html_escape(&exercise.title)
    );

    page_shell(&exercise.title, "..", categories, Some((category, num)), &body)
}

fn html_escape(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
        .replace('"', "&quot;")
}
