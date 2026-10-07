//! WASM entry point used by the generated exercise pages to run a
//! visitor's Uiua code against a single predefined test snippet.
//!
//! Each call is fully isolated: a fresh interpreter is created, the
//! visitor's code is concatenated with the test snippet, and the result
//! is reported back as a simple string so the JS side doesn't need any
//! extra (de)serialization glue.

use std::time::Duration;

use uiua::{
    PrimClass, Primitive, SafeSys, Signature, Uiua,
    lsp::{SpanKind, Spans},
};
use wasm_bindgen::prelude::*;

/// Maximum wall-clock time a single test run may take before it is
/// aborted. This guards against accidental infinite loops in visitor code.
const EXECUTION_LIMIT: Duration = Duration::from_secs(3);

/// Run `user_code` followed by `test_code` in a fresh interpreter.
///
/// Returns `"PASS"` if the program ran to completion without error
/// (i.e. every `⍤` assertion in `test_code` held), or `"FAIL: <message>"`
/// with the Uiua error message otherwise.
#[wasm_bindgen]
pub fn run_test(user_code: &str, test_code: &str) -> String {
    let program = format!("{user_code}\n{test_code}");
    let mut env = Uiua::with_backend(SafeSys::new()).with_execution_limit(EXECUTION_LIMIT);
    match env.run_str(&program) {
        Ok(_) => "PASS".to_string(),
        Err(e) => format!("FAIL: {e}"),
    }
}

/// The CSS class used to color a function glyph, based on its signature
/// (number of array arguments it takes). Mirrors the scheme used by the
/// official Uiua pad (<https://uiua.org/pad>).
fn sig_class(sig: Signature) -> &'static str {
    match sig.args() {
        0 => "noadic-function",
        1 => "monadic-function",
        2 => "dyadic-function",
        3 => "triadic-function",
        4 => "tetradic-function",
        5 => "pentadic-function",
        _ => "hexadic-function",
    }
}

/// The CSS class used to color a modifier glyph, based on how many
/// functions it takes as arguments.
fn modifier_class(modifier_args: usize) -> &'static str {
    match modifier_args {
        0 | 1 => "monadic-modifier",
        2 => "dyadic-modifier",
        _ => "triadic-modifier",
    }
}

/// The CSS class used to color a primitive's glyph, or `None` if it
/// should be rendered in the default text color.
fn prim_class(prim: Primitive) -> Option<&'static str> {
    if matches!(prim.class(), PrimClass::Arguments | PrimClass::Debug) && prim.modifier_args().is_none() {
        return Some("stack-function");
    }
    if prim.class() == PrimClass::Constant {
        return Some("number-literal");
    }
    if let Some(args) = prim.modifier_args() {
        return Some(modifier_class(args));
    }
    prim.sig().map(sig_class)
}

/// The CSS class for a given span of code, or `None` if it should be
/// rendered in the default text color.
fn span_class(kind: &SpanKind) -> Option<&'static str> {
    match kind {
        SpanKind::Primitive(prim, _) | SpanKind::Subscript(Some(prim), _) => prim_class(*prim),
        SpanKind::PrimArgs(_) => Some("module"),
        SpanKind::Obverse(_) => prim_class(Primitive::Obverse),
        SpanKind::Number => Some("number-literal"),
        SpanKind::String | SpanKind::ImportSrc(_) => Some("string-literal-span"),
        SpanKind::Comment | SpanKind::OutputComment | SpanKind::TypeSigComment => {
            Some("comment-span")
        }
        SpanKind::Strand => Some("strand-span"),
        SpanKind::MacroDelim(args) => Some(modifier_class(*args)),
        _ => None,
    }
}

fn escape_html(s: &str) -> String {
    let mut out = String::with_capacity(s.len());
    for c in s.chars() {
        match c {
            '&' => out.push_str("&amp;"),
            '<' => out.push_str("&lt;"),
            '>' => out.push_str("&gt;"),
            '"' => out.push_str("&quot;"),
            _ => out.push(c),
        }
    }
    out
}

/// Render `code` as HTML, wrapping each glyph/token in a `<span>` whose
/// class colors it the same way the official Uiua pad does. Used to draw
/// a read-only, syntax-highlighted copy of the code behind the real
/// (transparent) editable textarea.
#[wasm_bindgen]
pub fn highlight_html(code: &str) -> String {
    let spans = Spans::from_input(code).spans;
    let mut out = String::with_capacity(code.len() + 64);
    let mut pos = 0usize;
    for sp in spans {
        let start = (sp.span.start.byte_pos as usize).max(pos).min(code.len());
        let end = (sp.span.end.byte_pos as usize).max(start).min(code.len());
        if start > pos {
            out.push_str(&escape_html(&code[pos..start]));
        }
        let text = &code[start..end];
        match span_class(&sp.value) {
            Some(class) => {
                out.push_str("<span class=\"");
                out.push_str(class);
                out.push_str("\">");
                out.push_str(&escape_html(text));
                out.push_str("</span>");
            }
            None => out.push_str(&escape_html(text)),
        }
        pos = end;
    }
    if pos < code.len() {
        out.push_str(&escape_html(&code[pos..]));
    }
    out
}
