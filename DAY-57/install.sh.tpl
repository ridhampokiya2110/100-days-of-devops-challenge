#!/bin/bash
sudo apt-get update -y
sudo apt-get install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2


echo "<h1>Welcome to the ${environment} Server!</h1><br><p>Managed automatically by the ${department}.</p>" > /var/www/html/index.html