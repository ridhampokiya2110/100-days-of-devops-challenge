#!/bin/bash

echo "Starting Security Scan..."

#loop through all .sh files
for file in *.sh; do
    if [ "$file" == "secure_permissions.sh" ]; then
        continue #skip own script
    fi

    #check if file execute permission
    if [ ! -x "$file" ]; then
        echo "permission for script: $file"
        chmod +x "$file"
        echo "...congratulations permission granted..."
    else
        echo "script already executed..!"
    fi
done    

# lock down .txt files
for file in *.txt; do 
    echo "securing private file"
    chmod 700 "$file"
    echo "...permission set to owner only(700)..."
done

ls -l