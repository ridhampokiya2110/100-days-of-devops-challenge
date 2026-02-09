#!/bin/bash

#target server
host="google.com"

#list of port to check
ports=(80 443 22 3306)

echo "scanning $host for open ports..."
echo "================================"

for port in "${ports[@]}"; do 

    #try to connect
    if timeout 1 bash -c "echo > /dev/tcp/$host/$port" 2>/dev/null; then
        echo "PORT IS OPEN...."
    else
        echo "PORT IS NOT OPEN...."
    fi
done
