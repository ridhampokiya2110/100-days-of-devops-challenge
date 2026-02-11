#!bin/bash

key_name="my_server_key"
echo "generating SSH keys for: $key_name"
echo "=================================="

#create a directory to store keys
mkdir -p keys

#generate key
ssh-keygen -t rsa -b 4096 -f "keys/$key_name" -N ""
echo "============================================="
echo "...Key Generated successfully..."
echo "Private key (KEEP SECRET): keys/$key_name"
echo "Public key (SHARE THIS): keys/$key_name.pub"
echo "============================================="

echo "Here is your Public Key (To put on Server):"
cat "keys/$key_name.pub"