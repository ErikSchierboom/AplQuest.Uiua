#!/usr/bin/env bash
# Build and serve the website
set -euo pipefail

./build.sh

cargo install miniserve
miniserve dist --index index.html --port 8000
