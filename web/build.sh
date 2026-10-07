#!/usr/bin/env bash
# Builds the static website in web/dist: the Uiua-in-the-browser WASM
# runner, the generated per-exercise HTML pages, and the shared CSS/JS.
#
# Requirements (all plain cargo/rustup, no Node.js):
#   rustup target add wasm32-unknown-unknown
#   cargo install wasm-bindgen-cli --version 0.2.108 --locked
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> Building runner for wasm32-unknown-unknown"
cargo build -p runner --target wasm32-unknown-unknown --release

echo "==> Generating JS bindings with wasm-bindgen"
mkdir -p dist/assets
wasm-bindgen \
  --target web \
  --out-dir dist/assets \
  --out-name runner \
  --no-typescript \
  target/wasm32-unknown-unknown/release/runner.wasm

echo "==> Generating exercise pages"
cargo run -p site-gen --release

echo "==> Done. Static site is in web/dist/"
