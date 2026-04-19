#!/usr/bin/env bash
set -euo pipefail

# Minimal, robust WordForge (uses awk for correctness)

read -r -p "Enter path to wordlist file: " file
if [[ ! -f "$file" ]]; then
echo "Error: file not found"
exit 1
fi

echo
echo "1) Length filter"
echo "2) Pattern filter (e.g. admin*)"
echo "3) Character type"
echo "4) Remove duplicates"
echo

read -r -p "Choose option: " opt

base="$(basename "$file")"
mkdir -p output
out="output/optimized_${base}.txt"

echo "Processing..."

case "$opt" in
1)
read -r -p "Enter length: " len
awk -v L="$len" 'length($0)==L' "$file" > "$out"
;;
2)
read -r -p "Enter pattern: " pat
# convert shell wildcard * to regex .*
awk -v p="$pat" 'BEGIN{gsub(/*/, ".*", p)} $0 ~ "^" p "$"' "$file" > "$out"
;;
3)
echo "1: numbers | 2: lowercase | 3: alphanumeric"
read -r -p "Choose: " t
case "$t" in
1) awk '/^[0-9]+$/' "$file" > "$out" ;;
2) awk '/^[a-z]+$/' "$file" > "$out" ;;
3) awk '/^[a-zA-Z0-9]+$/' "$file" > "$out" ;;
*) echo "Invalid choice"; exit 1 ;;
esac
;;
4)
awk '!seen[$0]++' "$file" > "$out"
;;
*)
echo "Invalid option"
exit 1
;;
esac

total=$(wc -l < "$file")
matched=$(wc -l < "$out")

echo
echo "Done"
echo "Total words: $total"
echo "Matched words: $matched"
echo "Saved: $out"
