#!/bin/bash

# Update APT repos
sudo apt-get update

# Install nginx
sudo apt-get install -y nginx

# Start nginx
sudo service nginx start
