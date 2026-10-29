#!/bin/bash

sudo apt update -y
sudo apt install -y nginx

systemctl enable nginx
systemctl start nginx

echo "Hello from $(hostname)" > /usr/share/nginx/html/index.html

