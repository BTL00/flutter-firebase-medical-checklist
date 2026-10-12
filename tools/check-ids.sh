#!/usr/bin/env bash
# Verifies that every checklist item has a unique ID (per language) and valid tags,
# and that each translation has the same set of IDs as the English source.
# Usage: tools/check-ids.sh   (exit 1 on problems)
set -euo pipefail
cd "$(dirname "$0")/.."

status=0
id_re='^- \[[ xX]\] \*\*[A-Z0-9]+-[0-9]+\*\*'

ids_in_dir() {  # $1 = directory; non-recursive
  cat "$1"/*.md | grep -oE "$id_re" | sed -E 's/^- \[[ xX]\] \*\*([A-Z0-9]+-[0-9]+)\*\*/\1/'
}

check_dir() {  # $1 = directory
  local dir="$1" items dupes bad noid total
  items=$(ids_in_dir "$dir")
  total=$(printf '%s\n' "$items" | grep -c . || true)
  dupes=$(printf '%s\n' "$items" | sort | uniq -d || true)
  if [ -n "$dupes" ]; then
    echo "[$dir] Duplicate IDs:"; printf '%s\n' "$dupes"; status=1
  fi
  bad=$(grep -nE "$id_re" "$dir"/*.md | grep -vE '\[(EU|US|ALL)\]\[(M|S|N)\]' || true)
  if [ -n "$bad" ]; then
    echo "[$dir] Items without [EU|US|ALL][M|S|N] tags:"; printf '%s\n' "$bad"; status=1
  fi
  noid=$(grep -nE '^- \[[ xX]\] ' "$dir"/*.md | grep -vE "^[^:]+:[0-9]+:- \[[ xX]\] \*\*[A-Z0-9]+-[0-9]+\*\*" || true)
  if [ -n "$noid" ]; then
    echo "[$dir] Checkbox items without an ID:"; printf '%s\n' "$noid"; status=1
  fi
  echo "[$dir] items: $total"
}

check_dir checklist
for lang in checklist/*/; do
  [ -d "$lang" ] || continue
  lang="${lang%/}"
  check_dir "$lang"
  missing=$(comm -23 <(ids_in_dir checklist | sort) <(ids_in_dir "$lang" | sort) || true)
  extra=$(comm -13 <(ids_in_dir checklist | sort) <(ids_in_dir "$lang" | sort) || true)
  if [ -n "$missing" ]; then echo "[$lang] IDs missing vs English:"; printf '%s\n' "$missing"; status=1; fi
  if [ -n "$extra" ]; then echo "[$lang] IDs not in English:"; printf '%s\n' "$extra"; status=1; fi
done

exit $status
