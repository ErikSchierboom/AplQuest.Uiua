#!/usr/bin/env bash
#
# Build and serve the website

set -euo pipefail

die() { echo >&2 "$*"; exit 1; }

required_tool() {
    command -v "${1}" >/dev/null 2>&1 ||
        die "${1} is required but not installed. Please install it and make sure it's in your PATH."
}

required_tool "npx"

cd "$(dirname "${BASH_SOURCE[0]}")"

npx prettier --write "dist/**"