#!/usr/bin/env bash

figlet -c "WL-Optimizer" | lolcat

# ===== INPUT =====

read -r -p "Enter path to wordlist file: " file_name
file_name=$(echo "$file_name" | xargs)

if [ ! -f "$file_name" ]; then
echo "Error: file not found"
exit 1
fi

# ===== MENU =====

echo ""
echo "1. Length filter"
echo "2. Pattern filter"
echo "3. Character type"
echo "4. Remove duplicates"
echo ""

read -r -p "Choose option: " option

# ===== OUTPUT =====

base=$(basename "$file_name")
mkdir -p output
output_file="output/optimized_$base.txt"

> "$output_file"

echo ""
echo "Processing..."

# ===== OPTIONS =====

if [ "$option" = "1" ]; then

read -r -p "Enter length: " len
count=0

while IFS= read -r line || [ -n "$line" ]; do
clean=$(echo "$line" | xargs)

```
if [ "${#clean}" -eq "$len" ]; then
  echo "$clean" >> "$output_file"
  count=$((count + 1))
fi
```

done < "$file_name"

elif [ "$option" = "2" ]; then

read -r -p "Enter pattern (example: admin*): " pattern
count=0

while IFS= read -r line || [ -n "$line" ]; do
clean=$(echo "$line" | xargs)

```
if [[ $clean == $pattern ]]; then
  echo "$clean" >> "$output_file"
  count=$((count + 1))
fi
```

done < "$file_name"

elif [ "$option" = "3" ]; then

echo "1: numbers | 2: lowercase | 3: alphanumeric"
read -r -p "Choose: " t
count=0

while IFS= read -r line || [ -n "$line" ]; do
clean=$(echo "$line" | xargs)

```
case "$t" in
  1)
    [[ "$clean" =~ ^[0-9]+$ ]] && echo "$clean" >> "$output_file" && count=$((count + 1))
    ;;
  2)
    [[ "$clean" =~ ^[a-z]+$ ]] && echo "$clean" >> "$output_file" && count=$((count + 1))
    ;;
  3)
    [[ "$clean" =~ ^[a-zA-Z0-9]+$ ]] && echo "$clean" >> "$output_file" && count=$((count + 1))
    ;;
  *)
    echo "Invalid choice"
    exit 1
    ;;
esac
```

done < "$file_name"

elif [ "$option" = "4" ]; then

awk '!seen[$0]++' "$file_name" > "$output_file"
count=$(wc -l < "$output_file")

else
echo "Invalid option"
exit 1
fi

# ===== RESULT =====

total_words=$(wc -l < "$file_name")

echo ""
echo "Done"
echo "Total words: $total_words"
echo "Matched words: $count"
echo "Saved: $output_file"
