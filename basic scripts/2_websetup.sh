#!/bin/bash

# Installing Dependencies
echo "##########################################"
echo "Installing packeges"
echo "##########################################"
sudo yum install wget unzip httpd -y > /dev/null
echo

# Start & Enable Service
echo "##########################################"
echo "Start & Enabled HTTPD Service"
echo "##########################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Create Temp Derectory
echo "##########################################"
echo "Starting Artifact Deployment"
echo "##########################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

wget https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip > /dev/null
unzip 2136_kool_form_pack.zip > /dev/null
sudo cp -r 2136_kool_form_pack/* /var/www/html/
echo

# Bounce Service
echo "##########################################"
echo "Restarting HTTPD service"
echo "##########################################"
systemctl restart httpd
echo

# Clean Up
echo "##########################################"
echo "Removing Temporary Files"
echo "##########################################"
rm -fr /tmp/webfiles
echo

sudo systemctl status httpd
ls /var/www/html
