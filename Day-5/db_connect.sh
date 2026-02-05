#!/bin/bash

echo "Connecting to the database..."

#load the secrets of .env file
if [ -f .env ]; then
    echo "Loading..."
    source .env
else
    echo "Error"
    exit 1
fi

#simulate connection
echo "connecting to host: $DB_HOST"
echo "logging in user: $DB_USER"

#password check
if [ "$DB_PASSWORD" == "SuperSecretPassword123" ]; then
    echo "Authentication Successful...."
    echo "Connect to Database..."
else
    echo "Authentication Failed..."
fi