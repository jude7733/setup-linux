#!/usr/bin/env bash

echo -e "\v ---Installing neofetch---\v"
sudo apt install neofetch
neofetch

echo -e "\v ---Installing gdebi---\v"
sudo apt install gdebi

echo -e "\v ---Installing vlc---\v"
sudo apt install vlc

echo -e "\v ---Installing Libreoffice---\v"
sudo apt install libreoffice -y

echo -e "\v ---Installing GIMP---\v"
sudo apt install gimp -y

echo -e "\v ---Installing wget---\v"
sudo apt install software-properties-common apt-transport-https wget

#sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev

echo -e "\v ---Installing curl---\v"
sudo apt install curl

echo -e "\v ---Installing git---\v"
sudo apt install git

echo -e "\v ---Installing python3---\v"
sudo apt install python3

echo -e "\v ---Installing pip3---\v"
sudo apt install python3-pip

echo -e "\v ---Installing pipenv---\v"
pip3 install pipenv

echo -e "\v ---Installing thunderbird---\v"
sudo apt install thunderbird

echo -e "\v ---Installing htop---\v"
sudo apt install htop

#bleachbit

#echo -e "\v ---Installing discord---\v"
#wget https://discord.com/api/download?platform=linux&format=deb

echo -e "\v ---Installing spotify---\v"
sudo apt install spotify-client

echo -e "\v ---Installing vscode---\v"
sudo apt install code -y

echo -e "\v ---Installing kodi---\v"
sudo apt install kodi

echo -e "\v ---Installing timeshift---\v"
sudo apt install timeshift

echo -e "\v ---Installing telegram---\v"
sudo apt install telegram-desktop

echo -e "\v ---Installing github desktop---\v"
sudo wget https://github.com/shiftkey/desktop/releases/download/release-2.6.3-linux1/GitHubDesktop-linux-2.6.3-linux1.deb

