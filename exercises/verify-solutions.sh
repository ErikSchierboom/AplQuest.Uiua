#!/usr/bin/env bash
#
# Verify the solutions

for exercise in */*.ua; do
  echo "Testing $exercise"
  uiua "$exercise"
done
