#!/bin/bash

sudo dpkg --add-architecture i386

wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ impish main'
sudo apt update

echo -e "\v ---Installing wine---\v"
sudo apt install --install-recommends winehq-stable
wine --version
#config

echo -e "\v ---Installing steam---\v"
sudo apt install steam

echo -e "\v ---Installing lutris---\v"
sudo apt install lutris

echo -e "\v ---Installing playonlinux---\v"
sudo apt install playonlinux