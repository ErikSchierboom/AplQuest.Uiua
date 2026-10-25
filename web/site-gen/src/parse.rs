//! Parses an exercise `.ua` file into structured data the site generator
//! can render, without leaking the reference solution to visitors.
//!
//! Expected shape of a `.ua` file (as used throughout this repository):
//!
//! ```text
//! # <year>-<number>: <title>
//! # <description line>
//! # <more description lines...>
//!
//! <FunctionName> ← <reference solution expression>
//!
//! <optional setup line, e.g. `Expected ← ...`>
//! ⍤⤙≍ <expected> <call using FunctionName> # <optional test description>
//! ...
//! ```
//!
//! The reference solution line is extracted only to learn the function
//! name visitors must define; its body is discarded. Everything after it
//! (setup lines and assertions) is preserved so it can be run, unmodified,
//! against whatever code the visitor supplies.

pub struct Exercise {
    pub title: String,
    pub description: Vec<String>,
    pub tests: Vec<TestCase>,
}

pub struct TestCase {
    pub description: Option<String>,
    /// Uiua source to run after the visitor's code: accumulated setup
    /// lines (e.g. `Expected ← ...`) followed by the assertion line.
    pub code: String,
}

/// Parse the contents of a single `.ua` exercise file.
///
/// Returns `None` if the file doesn't follow the expected shape (for
/// example, if it's empty or missing a reference solution), so callers
/// can skip such files instead of failing the whole build.
pub fn parse(content: &str) -> Option<Exercise> {
    let mut lines = content.lines().peekable();

    // Leading comment block (interspersed with blank lines) becomes the
    // title (first line) and description (remaining lines).
    let mut header_lines = Vec::new();
    while let Some(line) = lines.peek() {
        let trimmed = line.trim();
        if trimmed.is_empty() {
            lines.next();
        } else if let Some(comment) = trimmed.strip_prefix('#') {
            header_lines.push(comment.trim().to_string());
            lines.next();
        } else {
            break;
        }
    }
    let mut header_lines = header_lines.into_iter();
    let title = header_lines.next()?;
    // The `# Experimental!` semantic comment enables experimental Uiua
    // primitives for the rest of the file; it's a code directive, not
    // problem prose, so it's pulled out of the description.
    let description: Vec<String> = header_lines
        .filter(|line| line != "Experimental!")
        .collect();

    // The first non-comment, non-blank line is the reference solution.
    lines.next();

    // Remaining lines are either setup (re-used by later assertions) or
    // assertions themselves (identified by the `⍤` assert primitive).
    // Setup statements, in order. A line containing `←` starts a new
    // statement; other lines continue the previous one (multi-line arrays).
    // Redefining a name replaces its earlier statement.
    let mut setup: Vec<(Option<&str>, Vec<&str>)> = Vec::new();
    let mut tests = Vec::new();
    for line in lines {
        let trimmed = line.trim();
        if trimmed.is_empty() {
            continue;
        }
        if trimmed.contains('⍤') {
            let (code, description) = split_trailing_comment(trimmed);
            let mut full: Vec<&str> = setup
                .iter()
                .flat_map(|(_, lines)| lines.iter().copied())
                .collect();
            full.push(code);
            tests.push(TestCase {
                description,
                code: full.join("\n"),
            });
        } else {
            match trimmed.split_once('←') {
                Some((name, _)) => {
                    let name = name.trim();
                    setup.retain(|(n, _)| *n != Some(name));
                    setup.push((Some(name), vec![line.trim_end()]));
                }
                None => match setup.last_mut() {
                    Some((_, lines)) => lines.push(line.trim_end()),
                    None => setup.push((None, vec![line.trim_end()])),
                },
            }
        }
    }

    if tests.is_empty() {
        return None;
    }

    Some(Exercise {
        title,
        description,
        tests,
    })
}

/// Split a line into its Uiua source and an optional trailing `#` comment,
/// ignoring any `#` that appears inside a double-quoted string literal.
fn split_trailing_comment(line: &str) -> (&str, Option<String>) {
    let mut in_string = false;
    let mut escaped = false;
    for (i, ch) in line.char_indices() {
        if in_string {
            if escaped {
                escaped = false;
            } else if ch == '\\' {
                escaped = true;
            } else if ch == '"' {
                in_string = false;
            }
        } else if ch == '"' {
            in_string = true;
        } else if ch == '#' {
            let code = line[..i].trim_end();
            let comment = line[i + 1..].trim();
            return (
                code,
                if comment.is_empty() {
                    None
                } else {
                    Some(comment.to_string())
                },
            );
        }
    }
    (line, None)
}
