#!/bin/bash

set -e

echo "Installing apache2-utils..."

sudo apt update
sudo apt install -y apache2-utils

if [ ! -f .htpasswd ]; then
    echo "Creating .htpasswd..."
    htpasswd -c .htpasswd admin
else
    echo ".htpasswd already exists."
fi

echo "Done."