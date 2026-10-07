# APL Quest in Uiua — website

A static website, generated from the exercises in [`../exercises`](../exercises),
where each problem gets its own page with a Uiua code editor. Code runs
entirely in the browser via a small WebAssembly build of the
[`uiua`](https://docs.rs/uiua) interpreter — there's no server and no
Node.js involved, at build time or at runtime.

## Layout

- [`runner/`](runner) — a `cdylib` crate compiled to `wasm32-unknown-unknown`
  that exposes a `run_test(user_code, test_code)` function: it runs the two
  concatenated snippets in a fresh, sandboxed Uiua interpreter and reports
  `"PASS"` or `"FAIL: <message>"`.
- [`site-gen/`](site-gen) — a small binary that parses every `.ua` file under
  `../exercises/<category>/<number>.ua`, extracts the problem description,
  the solution's function name, and each test assertion (without exposing
  the reference solution itself), and renders static HTML pages from that.
- [`assets/`](assets) — hand-written `style.css` and `app.js`, copied
  as-is into the generated site.
- `dist/` — the generated, fully static website (HTML + CSS + JS + the
  compiled `.wasm`), committed so it can be hosted directly (e.g. via
  GitHub Pages) with no build step required by consumers.

## Building

Requires only `rustup`/`cargo` and `wasm-bindgen-cli` (itself a cargo
package, not an npm one):

```sh
rustup target add wasm32-unknown-unknown
cargo install wasm-bindgen-cli --version 0.2.108 --locked
```

Then, from this directory:

```sh
./build.sh
```

This rebuilds `runner` for `wasm32-unknown-unknown`, regenerates its JS
bindings with `wasm-bindgen`, and re-runs `site-gen` to regenerate every
page in `dist/`. Run it again whenever an exercise file or the runner/
generator/assets change.

## Previewing locally

`dist/` is a plain static site; serve it with anything that can serve
static files, for example:

```sh
python3 -m http.server 8000 --directory dist
```

then open `http://localhost:8000/`. Opening `dist/index.html` directly via
`file://` will not work in most browsers, since loading the `.wasm` module
requires HTTP(S).

## Adding or editing an exercise

Add or edit a `.ua` file under `../exercises/<category>/<number>.ua`. The
expected shape (see any existing file for an example):

```
# <Title>
# <One or more description lines>

<FunctionName> ← <reference solution>

<optional setup line(s), e.g. `Expected ← ...`>
⍤⤙≍ <expected> <call to FunctionName> # <optional, shown as the test's label>
...
```

Re-run `./build.sh` afterwards to regenerate the site. Note: if a
solution uses an experimental Uiua primitive, add a `# Experimental!`
line to the header (anywhere among the description comments); the
generator detects it and prepends it to the visitor's code stub
automatically.
