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
<p>Problem statements and reference tests are adapted from
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
pub fn render_exercise(
    categories: &Categories,
    category: &str,
    num: &str,
    exercise: &Exercise,
) -> String {
    let description = exercise
        .description
        .iter()
        .map(|line| format!("<p>{}</p>\n", html_escape(line)))
        .collect::<String>();

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

    let stub = if exercise.experimental {
        html_escape(&format!(
            "# Experimental!\n{} ← \n",
            exercise.function_name
        ))
    } else {
        html_escape(&format!("{} ← \n", exercise.function_name))
    };

    let body = format!(
        r#"<header>
<h1>{title}</h1>
{description}<p class="hint">Define a function named <code>{function_name}</code>; the tests below will call it.</p>
</header>
<section class="editor">
<div class="code-editor">
<pre class="code-highlight" aria-hidden="true"><code id="code-highlight"></code></pre>
<textarea id="code" spellcheck="false" autocapitalize="off" autocomplete="off" autocorrect="off">{stub}</textarea>
</div>
<div class="actions">
<button id="run">Run tests</button>
<span id="status"></span>
</div>
</section>
<section id="results" class="results"></section>
<script type="application/json" id="tests-data">{tests_json}</script>
<script type="module" src="../assets/app.js"></script>
"#,
        title = html_escape(&exercise.title),
        function_name = html_escape(&exercise.function_name),
    );

    page_shell(&exercise.title, "..", categories, Some((category, num)), &body)
}

fn html_escape(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
        .replace('"', "&quot;")
}
