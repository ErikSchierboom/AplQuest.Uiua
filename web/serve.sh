#!/usr/bin/env bash
#
# Build and serve the website

set -euo pipefail

die() { echo >&2 "$*"; exit 1; }

required_tool() {
    command -v "${1}" >/dev/null 2>&1 ||
        die "${1} is required but not installed. Please install it and make sure it's in your PATH."
}

required_tool "cargo"

cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> Installing dependencies"

cargo install miniserve

echo "==> Building the website"
./build.sh

echo "==> Formatting the website"
./format.sh

echo "==> Serving the website"
miniserve "dist" --index index.html --port 8000
