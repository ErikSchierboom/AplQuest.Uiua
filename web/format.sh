#!/usr/bin/env bash
#
# Build and serve the website

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

npx prettier --write "dist/**"