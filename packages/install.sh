#!/bin/bash

# install packages
sudo dnf install -y $(cat packages.txt)

# install flatpaks
flatpak install -y $(cat flatpaks.txt)

echo "Installation complete"
