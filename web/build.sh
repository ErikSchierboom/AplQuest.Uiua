#!/usr/bin/env bash
#
# Build the website

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> Installing dependencies"
rustup target add wasm32-unknown-unknown
cargo install wasm-bindgen-cli --version 0.2.108 --locked

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
