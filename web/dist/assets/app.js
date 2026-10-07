// Shared logic for every generated exercise page. Loads the WASM Uiua
// runner once, then runs the visitor's code against each predefined test
// when the "Run tests" button is clicked.

const statusEl = document.getElementById("status");
const runButton = document.getElementById("run");
const codeEl = document.getElementById("code");
const highlightEl = document.getElementById("code-highlight");
const resultsEl = document.getElementById("results");
const testsDataEl = document.getElementById("tests-data");

const tests = JSON.parse(testsDataEl.textContent);
const storageKey = `uiua-quest:${location.pathname}`;

// Restore the visitor's previous attempt, if any.
const saved = localStorage.getItem(storageKey);
if (saved !== null) {
  codeEl.value = saved;
}

let highlight;
let docsUrlAt;

// Re-render the colored glyphs behind the (transparent) textarea so they
// stay in sync with what's actually typed.
function renderHighlight() {
  if (!highlight) return;
  // A trailing newline is appended so a final blank line still reserves
  // a row of height, keeping the overlay's scroll height matching the
  // textarea's (browsers always render one extra blank line for a
  // trailing "\n" in a textarea).
  highlightEl.innerHTML = `${highlight(codeEl.value)}\n`;
}

codeEl.addEventListener("input", () => {
  localStorage.setItem(storageKey, codeEl.value);
  renderHighlight();
});
codeEl.addEventListener("scroll", () => {
  highlightEl.parentElement.scrollTop = codeEl.scrollTop;
  highlightEl.parentElement.scrollLeft = codeEl.scrollLeft;
});

// The textarea (which the visitor can drag-resize) is the source of
// truth for the editor's size; keep the highlighted overlay's box the
// same size so the two stay pixel-aligned.
if (window.ResizeObserver) {
  new ResizeObserver(() => {
    highlightEl.parentElement.style.height = `${codeEl.offsetHeight}px`;
  }).observe(codeEl);
}

// Hint that Cmd/Ctrl-clicking a glyph opens its docs, like the official
// Uiua pad, by switching to a pointer cursor while the modifier is held.
codeEl.addEventListener("mousemove", (event) => {
  codeEl.classList.toggle("ctrl-held", event.ctrlKey || event.metaKey);
});
codeEl.addEventListener("mouseleave", () => {
  codeEl.classList.remove("ctrl-held");
});
codeEl.addEventListener("click", (event) => {
  if (!docsUrlAt || !(event.ctrlKey || event.metaKey)) return;
  // The textarea's native click handling already moved the caret to the
  // clicked position by the time this listener runs.
  const url = docsUrlAt(codeEl.value, codeEl.selectionStart);
  if (url) {
    window.open(url, "_blank", "noopener");
  }
});

runButton.disabled = true;
statusEl.textContent = "Loading Uiua...";

let runTest;
try {
  const mod = await import("../assets/runner.js");
  await mod.default();
  runTest = mod.run_test;
  highlight = mod.highlight_html;
  docsUrlAt = mod.primitive_docs_url_at;
  statusEl.textContent = "";
  renderHighlight();
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
