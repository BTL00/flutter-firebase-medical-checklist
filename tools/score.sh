#!/usr/bin/env bash
# Scores a filled-in copy of the checklist.
# Usage: tools/score.sh [EU|US|ALL]   (default: ALL = count everything)
# Tick items by changing "- [ ]" to "- [x]" in your fork or copy.
set -euo pipefail
cd "$(dirname "$0")/.."
market="${1:-ALL}"

filter() {
  case "$market" in
    EU)  grep -E '\[(EU|ALL)\]\[' ;;
    US)  grep -E '\[(US|ALL)\]\[' ;;
    *)   cat ;;
  esac
}

printf '%-45s %6s %6s %6s %6s\n' "file" "must" "must✓" "all" "all✓"
for f in checklist/*.md; do
  lines=$(grep -E '^- \[[ xX]\] \*\*[A-Z0-9]+-[0-9]+\*\*' "$f" | filter || true)
  must=$(printf '%s\n' "$lines" | grep -c '\]\[M\]' || true)
  must_done=$(printf '%s\n' "$lines" | grep -E '^- \[[xX]\]' | grep -c '\]\[M\]' || true)
  all=$(printf '%s\n' "$lines" | grep -c . || true)
  all_done=$(printf '%s\n' "$lines" | grep -cE '^- \[[xX]\]' || true)
  printf '%-45s %6s %6s %6s %6s\n' "$(basename "$f" .md)" "$must" "$must_done" "$all" "$all_done"
done
