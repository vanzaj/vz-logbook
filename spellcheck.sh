#!/usr/bin/env bash

#set -euxo pipefail

CUSTOM_DICT="./_ignore.pws"
FILES_TO_CHECK=$(find . -name '*.qmd')

MISSPELLED_WORDS_FILE="misspellings.txt"
touch "$MISSPELLED_WORDS_FILE"

for FILE in $FILES_TO_CHECK; do
  cat "$FILE" | aspell --mode=markdown --lang=en_GB --personal="$CUSTOM_DICT" list >> "$MISSPELLED_WORDS_FILE"
done

FINAL_LIST=$(sort -u "$MISSPELLED_WORDS_FILE")
COUNT=$(echo "$FINAL_LIST" | wc -w)

/bin/rm $MISSPELLED_WORDS_FILE

if [ $COUNT -gt 0 ]; then
  echo "❌ Found $COUNT misspelled words:"
  echo "$FINAL_LIST"
  exit 1
else
  echo "✅ Spell check passed. No misspellings found."
  exit 0
fi

