#!/bin/bash

#define list of targets
targets=("google.com" "facebook.com" "rewear-web.netlify.app" "127.0.0.1")

echo "starting connectivity check..."
echo "------------------------------"

#loop through the list
for site in "${targets[@]}"; do

    #ping the site
    if ping -n 1 "$site" &> /dev/null; then
        echo "your $site is Reachable"
    else
        echo "your $site is Unreachable"
    fi
done

echo "Check complete...."