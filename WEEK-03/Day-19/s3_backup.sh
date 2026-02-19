#!/bin/bash

#variables
backup_dir="my_project_data"
s3_bucket="s3://devops-day19"
date=$(date +"%Y-%m-%d")
archive_name="backup_$date.tar.gz"

echo "======================="
echo "start s3 bucket process"
echo "======================="

#create dummy data
mkdir -p "$backup_dir"
echo "DB password: 95860" > "$backup_dir/db_secret.txt"
echo "user logs..." > "$backup_dir/logs.txt"

#compress folder
echo "compress data into $archive_name.."
tar -czf "$archive_name" "$backup_dir"

#upload in AWS s3
echo "==================="
echo "upload in AWS s3..."
aws s3 cp "$archive_name" "$s3_bucket"
echo "==================="
