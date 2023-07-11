#!/bin/bash

echo -e "\v installing flatpak\v"
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#sudo apt install gnome-software-plugin-flatpak

echo -e "\v installing snap\v"
sudo apt install snapd
#sudo snap install snap-store