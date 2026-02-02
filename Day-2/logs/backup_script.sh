#!/bin/bash

#define source and backup directories
source_dir = "./logs"
backup_dir = "./backup_logs"
timestamp = $(date +"%Y%m%d_%H%M%S")
backup_file = "backup_$timestamp.tar.gz"

echo "Creating backup of logs..."

#Check if backup directory exists, if not create it
if [ ! -d "$backup_dir" ]; then
    echo "Backup directory does not exist. Creating now..."
    mkdir -p "$backup_dir"
fi 

#create backup using tar 
echo "compressing logs from $source_dir"
tar -czf "$backup_dir/$backup_file" "$source_dir"

#verify
echo "Backup created successfully"
echo "Backup file: $backup_dir/$backup_file"
ls -lh "$backup_dir/$backup_file"