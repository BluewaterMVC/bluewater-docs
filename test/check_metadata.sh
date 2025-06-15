#!/bin/bash

# Description:
# Checks all Markdown files for:
#   - "Last updated:" line (case insensitive)
#   - CC BY 4.0 License line (case insensitive)
# Skips /phpdoc/ and /node_modules/ directories

fail=0

echo "🔎 Checking Markdown metadata..."

for file in $(find . -type f -name "*.md" | grep -Ev 'phpdoc/|node_modules/'); do
  missing=""
  if ! grep -iq 'Last updated:' "$file"; then
    missing+="[missing: Last updated] "
    fail=1
  fi
  if ! grep -iq 'CC BY 4.0 License' "$file"; then
    missing+="[missing: CC BY 4.0 License] "
    fail=1
  fi
  if [ -n "$missing" ]; then
    echo "❌ $file $missing"
  else
    echo "✅ $file"
  fi
done

if [ $fail -ne 0 ]; then
  echo "❗ One or more Markdown files are missing required metadata."
  exit 1
else
  echo "🎉 All Markdown files passed metadata checks."
  exit 0
fi
