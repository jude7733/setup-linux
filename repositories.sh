#!/bin/bash

echo -e "\v ---adding multiverse---\v"
sudo add-apt-repository multiverse

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

sudo add-apt-repository ppa:lutris-team/lutris

sudo add-apt-repository ppa:libreoffice

sudo add-apt-repository ppa:mozillateam/ppa

sudo add-apt-repository ppa:otto-kesselgulasch/gimp
