#!/bin/bash

source_dir="source_code"
backup_file="backup_data.tar.gz"

echo "Starting Backup Process"
echo "================================"

#check if source folder exists 
if [ ! -d "$source_dir" ]; then
    echo "Error folder not found..!!!"
    exit 1
fi

echo "compressing file..."
tar -czf "$backup_file" "$source_dir"

echo "================================"
echo "Backup Successful..............."

#compare size
original=$(du -sh "$source_dir" | cut -f1)
compressed=$(du -sh "$backup_file" | cut -f1)

echo "Original Size: $original"
echo "Compressed Size: $compressed"

echo "================================"
