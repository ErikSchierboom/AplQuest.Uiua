// Shared logic for every generated exercise page. Loads the WASM Uiua
// runner once, then runs the visitor's code against each predefined test
// when the "Run tests" button is clicked.

const statusEl = document.getElementById("status");
const runButton = document.getElementById("run");
const codeEl = document.getElementById("code");
const resultsEl = document.getElementById("results");
const testsDataEl = document.getElementById("tests-data");

const tests = JSON.parse(testsDataEl.textContent);
const storageKey = `uiua-quest:${location.pathname}`;

// Restore the visitor's previous attempt, if any.
const saved = localStorage.getItem(storageKey);
if (saved !== null) {
  codeEl.value = saved;
}
codeEl.addEventListener("input", () => {
  localStorage.setItem(storageKey, codeEl.value);
});

runButton.disabled = true;
statusEl.textContent = "Loading Uiua...";

let runTest;
try {
  const mod = await import("../assets/runner.js");
  await mod.default();
  runTest = mod.run_test;
  statusEl.textContent = "";
} catch (err) {
  console.error(err);
  statusEl.textContent = "Failed to load the Uiua runtime.";
}
runButton.disabled = !runTest;

runButton.addEventListener("click", () => {
  resultsEl.innerHTML = "";
  const code = codeEl.value;
  let passed = 0;

  tests.forEach((test, index) => {
    const outcome = runTest(code, test.code);
    const ok = outcome === "PASS";
    if (ok) passed++;

    const row = document.createElement("div");
    row.className = `test-result ${ok ? "pass" : "fail"}`;

    const icon = document.createElement("span");
    icon.className = "icon";
    icon.textContent = ok ? "✓" : "✗";
    row.appendChild(icon);

    const detail = document.createElement("div");
    detail.className = "detail";
    const label = document.createElement("span");
    label.textContent = test.description || `Test ${index + 1}`;
    detail.appendChild(label);
    if (!ok) {
      const message = document.createElement("span");
      message.className = "message";
      message.textContent = outcome.replace(/^FAIL: /, "");
      detail.appendChild(message);
    }
    row.appendChild(detail);

    resultsEl.appendChild(row);
  });

  const summary = document.createElement("div");
  summary.className = "summary";
  summary.textContent = `${passed} / ${tests.length} tests passed`;
  resultsEl.prepend(summary);
});
