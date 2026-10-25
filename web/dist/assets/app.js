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

// Turn the visitor's body into a full definition. Multi-line bodies are
// wrapped in parentheses so every line belongs to The code.
function buildProgram(body) {
  // Only strip newlines: a trailing space can be significant (`@ `).
  const trimmed = body.replace(/^\s*\n|\n\s*$/g, "");
  const definition = trimmed.includes("\n")
    ? `Solution ← (\n${trimmed}\n)`
    : `Solution ← ${trimmed}`;
  // Always enable experimental primitives
  return `# Experimental!\n${definition}`;
}

// Show `<Name>` in tests where the visitor's solution gets called.
const namePattern = new RegExp(
  `(?<![\\p{L}\\p{N}_])Solution(?![\\p{L}\\p{N}_])`,
  "gu",
);
function escapeHtml(text) {
  return text
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;");
}
function markSolution(html) {
  return html.replace(namePattern, `&lt;Solution&gt;`);
}

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
let formatCode;
try {
  // 256418328f04a4ea is substituted by site-gen so a rebuilt runner is never
  // served from the browser cache.
  const mod = await import("../assets/runner.js?v=256418328f04a4ea");
  await mod.default({
    module_or_path: new URL(
      "../assets/runner_bg.wasm?v=256418328f04a4ea",
      import.meta.url,
    ),
  });
  runTest = mod.run_test;
  highlight = mod.highlight_html;
  docsUrlAt = mod.primitive_docs_url_at;
  formatCode = mod.format_code;
  statusEl.textContent = "";
  renderHighlight();
} catch (err) {
  console.error(err);
  statusEl.textContent = "Failed to load the Uiua runtime.";
}
runButton.disabled = !runTest;

// One row per test, showing the test's code (not its comment). Rows start
// neutral and are marked pass/fail in place when the tests are run.
const summaryEl = document.createElement("div");
summaryEl.className = "summary";
resultsEl.appendChild(summaryEl);

const rows = tests.map((test) => {
  const row = document.createElement("div");
  row.className = "test-result";

  const icon = document.createElement("span");
  icon.className = "icon";
  row.appendChild(icon);

  const detail = document.createElement("div");
  detail.className = "detail";
  const pre = document.createElement("pre");
  pre.className = "test-code";
  const code = document.createElement("code");
  if (highlight) {
    code.innerHTML = markSolution(highlight(test.code));
  } else {
    code.innerHTML = markSolution(escapeHtml(test.code));
  }
  pre.appendChild(code);
  detail.appendChild(pre);
  const message = document.createElement("span");
  message.className = "message";
  message.hidden = true;
  detail.appendChild(message);
  row.appendChild(detail);

  resultsEl.appendChild(row);
  return { row, icon, message };
});

// Format the visitor's code in place, leaving it untouched if it doesn't
// parse.
function formatEditor() {
  const formatted = formatCode?.(codeEl.value);
  if (formatted && formatted !== codeEl.value) {
    codeEl.value = formatted;
    localStorage.setItem(storageKey, formatted);
    renderHighlight();
  }
}

// Cmd/Ctrl/Shift-Enter formats the code and runs the tests.
codeEl.addEventListener("keydown", (event) => {
  if (
    event.key === "Enter" &&
    (event.metaKey || event.ctrlKey || event.shiftKey) &&
    !runButton.disabled
  ) {
    event.preventDefault();
    runButton.click();
  }
});

runButton.addEventListener("click", () => {
  formatEditor();
  const code = buildProgram(codeEl.value);
  let passed = 0;

  tests.forEach((test, index) => {
    const outcome = runTest(code, test.code);
    const ok = outcome === "PASS";
    if (ok) passed++;

    const { row, icon, message } = rows[index];
    row.className = `test-result ${ok ? "pass" : "fail"}`;
    icon.textContent = ok ? "✓" : "✗";
    message.hidden = ok;
    // Keep only the failure message (the actual value); drop the
    // traceback, which just repeats the test's code and expected value.
    message.textContent = ok
      ? ""
      : outcome.replace(/^FAIL: /, "").split(/\n\s+at /)[0];
  });

  summaryEl.textContent = `${passed} / ${tests.length} tests passed`;
});
