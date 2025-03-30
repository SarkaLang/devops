#!/bin/bash

# Variable Declaration
PACKAGE="httpd wget unzip"
SVC="httpd"
#URL="https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip"
#ART_NAME="2136_kool_form_pack"
TEMPDIR="/tmp/webfiles"

# Installing Dependencies
echo "##########################################"
echo "Installing packeges"
echo "##########################################"
sudo yum install $PACKAGE  -y > /dev/null
echo

# Start & Enable Service
echo "##########################################"
echo "Start & Enabled HTTPD Service"
echo "##########################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Create Temp Derectory
echo "##########################################"
echo "Starting Artifact Deployment"
echo "##########################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo

wget $1 > /dev/null
unzip $2 > /dev/null
sudo cp -r $2/* /var/www/html/
echo

# Bounce Service
echo "##########################################"
echo "Restarting HTTPD service"
echo "##########################################"
systemctl restart $SVC
echo

# Clean Up
echo "##########################################"
echo "Removing Temporary Files"
echo "##########################################"
rm -fr $TEMPDIR
echo

sudo systemctl status $SVC
ls /var/www/html
