//! WASM entry point used by the generated exercise pages to run a
//! visitor's Uiua code against a single predefined test snippet.
//!
//! Each call is fully isolated: a fresh interpreter is created, the
//! visitor's code is concatenated with the test snippet, and the result
//! is reported back as a simple string so the JS side doesn't need any
//! extra (de)serialization glue.

use std::time::Duration;

use uiua::{SafeSys, Uiua};
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
