#!/bin/bash

log_file="process_log.txt"

echo "starting process monitor......"

#start infinite loop
while true; do
    #time
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    #process count
    process_count=$(ps | wc -l)
    
    message="Time: $timestamp | Active processes: $process_count"

    echo "$message" >> "$log_file"
    echo "log saved: $message"

    sleep 5
done