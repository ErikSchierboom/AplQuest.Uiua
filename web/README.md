# APL Quest in Uiua — website

A static website, generated from the exercises in [`../exercises`](../exercises), where each problem gets its own page with a Uiua code editor.
Code runs entirely in client-side in the browser via a small WebAssembly build of the [`uiua`](https://docs.rs/uiua) interpreter.

## Previewing locally

To preview the website locally, run the following command:

```sh
./serve.sh
```

Then open `http://localhost:8000/`.

## Building

To (re-)build the website, run the following command:

```sh
./build.sh
```

This should be run whenever an exercise file or the runner/generator/assets change.

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

Re-run `./build.sh` afterwards to regenerate the site.
Note: the site always runs the visitor's code with `# Experimental!`, so experimental features can be used.
