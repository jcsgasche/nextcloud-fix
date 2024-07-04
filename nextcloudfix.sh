#!/bin/bash

# Check if the directory is provided as an argument
if [ -z "$1" ]; then
  echo "Please provide the directory as a parameter."
  exit 1
fi

nextcloudfilelocation="$1"

# Find files not newer than 1970-01-02 and save to damaged.txt
find "$nextcloudfilelocation" ! -newermt 1970-01-02 > damaged.txt

file="damaged.txt"
current_date=$(date +"%d %b %Y")

# Update the modification date of each file to today's date
while read -r line; do
  touch -d "$current_date" "$line"
done < "$file"

echo "The script has been successfully executed."

