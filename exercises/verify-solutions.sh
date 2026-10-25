#!/usr/bin/env bash
#
# Verify the solutions

cd "$(dirname "${BASH_SOURCE[0]}")"

for exercise in */*.ua; do
  if ! uiua "$exercise" &>/dev/null; then
    echo "$exercise: has failing tests"
  fi
done
