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
//! # Solution
//! <FunctionName> ← <reference solution, possibly spanning several lines>
//!
//! # Tests
//! <optional setup line, e.g. `Expected ← ...`>
//! ⍤⤙≍ <expected> <call using FunctionName> # <optional test description>
//!
//! ⍤⤙≍ <expected> <call using FunctionName>
//! ...
//! ```
//!
//! Tests are separated by blank lines; each one is self-contained, so
//! setup lines are not shared between tests.
//!
//! The reference solution (everything between the `# Solution` and
//! `# Tests` markers) is discarded. Everything after the `# Tests` marker
//! (setup lines and assertions) is preserved so it can be run, unmodified,
//! against whatever code the visitor supplies.

const SOLUTION_MARKER: &str = "# Solution";
const TESTS_MARKER: &str = "# Tests";

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
    // Everything before the `# Solution` marker is the header: the title
    // (first comment line) followed by the description.
    let mut lines = content.lines();
    let mut header_lines = Vec::new();
    for line in lines.by_ref() {
        let trimmed = line.trim();
        if trimmed == SOLUTION_MARKER {
            break;
        }
        if let Some(comment) = line.trim_start().strip_prefix('#') {
            // Keep indentation (minus the single space after `#`) so that
            // ASCII-art diagrams survive.
            let comment = comment.strip_prefix(' ').unwrap_or(comment);
            header_lines.push(comment.trim_end().to_string());
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

    // The reference solution runs up to the `# Tests` marker and is
    // discarded so it isn't leaked to visitors.
    if !lines.by_ref().any(|line| line.trim() == TESTS_MARKER) {
        return None;
    }

    // The rest of the file is a series of test blocks separated by blank
    // lines. Each block is self-contained: optional setup lines (e.g.
    // `Expected ← ...`) followed by the assertion line (identified by the
    // `⍤` assert primitive). A trailing `#` comment on the assertion line
    // becomes the test's description.
    let mut tests = Vec::new();
    let mut block: Vec<&str> = Vec::new();
    for line in lines.chain(std::iter::once("")) {
        if !line.trim().is_empty() {
            block.push(line.trim_end());
            continue;
        }
        if let Some(test) = parse_block(&block) {
            tests.push(test);
        }
        block.clear();
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

/// Turn one blank-line separated block into a test case. Returns `None` for
/// a block without an assertion.
fn parse_block(block: &[&str]) -> Option<TestCase> {
    let (last, setup) = block.split_last()?;
    if !last.contains('⍤') {
        return None;
    }
    let (assertion, description) = split_trailing_comment(last);
    let mut code = setup.to_vec();
    code.push(assertion);
    Some(TestCase {
        description,
        code: code.join("\n"),
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
