//! Renders the parsed exercise data into static HTML pages.

use serde::Serialize;

use crate::parse::Exercise;

#[derive(Serialize)]
struct TestCaseJson<'a> {
    description: Option<&'a str>,
    code: &'a str,
}

/// Common page chrome shared by every generated page.
///
/// `asset_prefix` is the relative path back to the `assets/` directory
/// (e.g. `"."` for the top-level index, `".."` for exercise pages one
/// directory deep), so the generated site works from any static host or
/// `file://` root without hardcoded absolute paths.
fn page_shell(title: &str, asset_prefix: &str, body: &str) -> String {
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
{body}
<footer class="attribution">
<p>Problem statements and reference tests are adapted from
<a href="https://apl.quest">APL Quest</a>
(<a href="https://github.com/Dyalog/apl.quest">Dyalog/apl.quest</a>), licensed under
<a href="https://creativecommons.org/licenses/by-nc-sa/4.0/">CC BY-NC-SA 4.0</a>.</p>
</footer>
</body>
</html>
"#
    )
}

/// Render the top-level index page listing every exercise, grouped by category.
pub fn render_index(categories: &[(String, Vec<(String, Exercise)>)]) -> String {
    let mut body = String::new();
    body.push_str("<header class=\"site-header\">\n");
    body.push_str("<h1>APL Quest in Uiua</h1>\n");
    body.push_str(
        "<p>Solve each exercise by writing <a href=\"https://www.uiua.org/\">Uiua</a> code \
         in the browser, then check it against the exercise's own tests.</p>\n",
    );
    body.push_str("</header>\n");

    for (category, exercises) in categories {
        body.push_str(&format!("<section class=\"category\">\n<h2>{category}</h2>\n<ul class=\"exercise-list\">\n"));
        for (num, exercise) in exercises {
            body.push_str(&format!(
                "<li><a href=\"{category}/{num}.html\">{}</a></li>\n",
                html_escape(&exercise.title)
            ));
        }
        body.push_str("</ul>\n</section>\n");
    }

    page_shell("APL Quest in Uiua", ".", &body)
}

/// Render a single exercise page.
pub fn render_exercise(exercise: &Exercise) -> String {
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
        r#"<a class="back-link" href="../index.html">&larr; All exercises</a>
<header>
<h1>{title}</h1>
{description}<p class="hint">Define a function named <code>{function_name}</code>; the tests below will call it.</p>
</header>
<section class="editor">
<textarea id="code" spellcheck="false" autocapitalize="off" autocomplete="off">{stub}</textarea>
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

    page_shell(&exercise.title, "..", &body)
}

fn html_escape(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
        .replace('"', "&quot;")
}
