#!/bin/bash

echo -e "\v ---adding multiverse---\v"
sudo add-apt-repository multiverse

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo add-apt-repository ppa:mozillateam/ppa