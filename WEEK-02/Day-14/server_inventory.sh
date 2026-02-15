#!/bin/bash

#define list of servers
servers=(
    "google.com"
    "facebook.com"
    "192.168.1.101"
    "192.168.1.102"
    "192.168.1.103"
    "192.168.1.104"
    "192.168.1.105"
)

report_file="server_report.csv"

#create csv header
echo "Server Name, IP Status, Web Port(80), Last Check" > "$report_file"

echo "=========================="
echo "STARTING INVENTORY SCAN..!"
echo "=========================="

for server in "${servers[@]}"; do 
    
    echo "Checking $server ...."

    #check pings
    if ping -n 1 "$server" $> /dev/null; then
        status="SERVER IS ON"

        #check port 80 and also timeout 1 for don't wait long
        if timeout 1 bash -c "echo > /dev/tcp/$server/80" 2>/dev/null; then
            port="PORT IS OPEN"
        else
            port="PORT IS CLOSED"
        fi
    else
        status="SERVER IS OFF"
        port="N/A"
    fi

    #save to CSV file
    timestamp=$(date "+%Y-%m-%d")
    echo "$server, $status, $port, $timestamp" >> "$report_file"
done

echo "================="
echo "Report Generated."
echo "================="
