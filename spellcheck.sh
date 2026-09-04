#!/usr/bin/env bash

set -euo pipefail

CUSTOM_DICT="./_ignore.pws"

if [[ $# -gt 0 ]]; then
  files=("$@")
else
  files=()
  while IFS= read -r -d '' file; do
    files+=("$file")
  done < <(find . -name '*.qmd' -print0)
fi

misspelled=$(cat "${files[@]}" | aspell --mode=markdown --lang=en_GB-ise \
  --add-extra-dicts=en_US --personal="$CUSTOM_DICT" list | sort -u)

if [[ -n "$misspelled" ]]; then
  count=$(wc -l <<< "$misspelled")
  echo "❌ Found $count misspelled words:"
  echo "$misspelled"
  exit 1
else
  echo "✅ Spell check passed. No misspellings found."
  exit 0
fi

