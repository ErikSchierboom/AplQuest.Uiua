#!/usr/bin/env bash
#
# Build the website

set -euo pipefail

die() { echo >&2 "$*"; exit 1; }

required_tool() {
    command -v "${1}" >/dev/null 2>&1 ||
        die "${1} is required but not installed. Please install it and make sure it's in your PATH."
}

required_tool "rustup"
required_tool "cargo"

cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> Installing dependencies"
rustup target add wasm32-unknown-unknown
if ! command -v wasm-bindgen >/dev/null || [[ "$(wasm-bindgen --version)" != *"0.2.108"* ]]; then
  cargo install wasm-bindgen-cli --version 0.2.108 --locked
fi

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
