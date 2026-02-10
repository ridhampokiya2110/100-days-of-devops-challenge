#!/bin/bash

log_file="server.log"

echo "analyzing log file: $log_file"
echo "============================="

#check if file exists
if [ ! -f "$log_file" ]; then 
    echo "Error: log file not found...!!!"
    exit 1
fi

#awk automatically splits lines by spaces
echo "---Full Summary---"
awk '{print $1, $3, $4, $5, $6}' "$log_file"
echo "====================================="

#filter only errors
echo "---Critical Errors Only---"
awk '$3 == "ERROR" {print $0}' "$log_file"

echo "==================================="

error_count=$(awk '$3 == "ERROR" {count++} END {print count}' "$log_file")
echo "total error found: $error_count"