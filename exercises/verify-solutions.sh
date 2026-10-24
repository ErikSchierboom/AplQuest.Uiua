#!/usr/bin/env bash
#
# Verify the solutions

for exercise in */*.ua; do
  if ! uiua "$exercise" &>/dev/null; then
    echo "$exercise: has failing tests"
  fi
done
