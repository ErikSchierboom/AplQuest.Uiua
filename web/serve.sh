#!/usr/bin/env bash
#
# Build and serve the website

set -euo pipefail

echo "==> Installing dependencies"
cargo install miniserve

echo "==> Building the website"
./build.sh

echo "==> Serving the website"
miniserve dist --index index.html --port 8000
