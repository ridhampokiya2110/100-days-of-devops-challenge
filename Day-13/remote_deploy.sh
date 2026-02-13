#!/bin/bash

#list of 10 server
server=(
    "192.168.1.101"
    "192.168.1.102"
    "192.168.1.103"
    "192.168.1.104"
    "192.168.1.105"
    "192.168.1.106"
    "192.168.1.107"
    "192.168.1.108"
    "192.168.1.109"
    "192.168.1.110"
)

#define user and command
user="admin"
command="sudo apt update && sudo apt upgrade -y"

echo "====================================="
echo "starting deployment on 10 server...!!"
echo "====================================="

for server in "${server[@]}"; do
    echo "connecting to $server....."

    #simulate the SSH command
    echo "ssh $user@$server \"$command\""
    sleep 1

    echo "=============================="
    echo "successfully updated...!!!"
    echo "=============================="
done    

