#!/usr/bin/env bash
# Verifies that every checklist item has a unique ID and valid tags.
# Usage: tools/check-ids.sh   (exit 1 on problems)
set -euo pipefail
cd "$(dirname "$0")/.."

status=0
items=$(grep -rhoE '^- \[[ xX]\] \*\*[A-Z0-9]+-[0-9]+\*\*' checklist/ | sed -E 's/^- \[[ xX]\] \*\*([A-Z0-9]+-[0-9]+)\*\*/\1/')
total=$(printf '%s\n' "$items" | grep -c . || true)
dupes=$(printf '%s\n' "$items" | sort | uniq -d || true)
if [ -n "$dupes" ]; then
  echo "Duplicate IDs:"; printf '%s\n' "$dupes"; status=1
fi

# Items missing an applicability tag or a level tag
bad=$(grep -rnE '^- \[[ xX]\] \*\*[A-Z0-9]+-[0-9]+\*\*' checklist/ | grep -vE '\[(EU|US|ALL)\]\[(M|S|N)\]' || true)
if [ -n "$bad" ]; then
  echo "Items without [EU|US|ALL][M|S|N] tags:"; printf '%s\n' "$bad"; status=1
fi

# Checkbox lines without an ID
noid=$(grep -rnE '^- \[[ xX]\] ' checklist/ | grep -vE '^\S+:- \[[ xX]\] \*\*[A-Z0-9]+-[0-9]+\*\*' || true)
if [ -n "$noid" ]; then
  echo "Checkbox items without an ID:"; printf '%s\n' "$noid"; status=1
fi

echo "Items: $total"
exit $status
