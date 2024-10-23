#!/bin/bash

# Update the system package database
echo "Updating system package database..."
sudo pacman -Syu --noconfirm

# Install prerequisites for building AUR packages
echo "Installing base-devel and git..."
sudo pacman -S --needed --noconfirm base-devel git

# Clone the yay repository from AUR
echo "Cloning the yay AUR repository..."
cd /opt
sudo git clone https://aur.archlinux.org/yay.git

# Change ownership of the directory to the current user
sudo chown -R $USER:$USER yay

# Enter the yay directory and build the package
cd yay
echo "Building and installing yay..."
makepkg -si --noconfirm

# Clean up
echo "Cleaning up..."
cd ..
rm -rf yay

# Verify installation
echo "yay installed successfully!"
yay --version
