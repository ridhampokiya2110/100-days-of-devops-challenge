#!/bin/bash

#infinite loop
while true; do

    clear
    echo "========================================="
    echo "         SYSTEM MONITOR DASHBOARD        "
    echo "========================================="

    #show date and time
    echo "Time Is: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "==========================================="

    #Check Internet Connection
    # -c 1 means send only 1 packet. -W 1 means wait max 1 second.
    if ping -c 1 google.com &> /dev/null; then
        echo "Internet Connected....!!"
    else 
        echo "Internet Disconnected....!!"
    fi
    #show RAM usage
    echo "RAM usage"
    free -h | grep "Mem"
    echo "--------------------------------"

    #show disk usage
    echo "DISK space"
    df -h 
    echo "--------------------------------"

    #show uptime
    echo "System Time"
    uptime
    echo "--------------------------------"

    #refresh rate
    echo "Refreshing in 10 second (ctrl+C for exit)"
    sleep 10

done