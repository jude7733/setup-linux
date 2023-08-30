#!/bin/bash

echo -e "\v ---This script is for apt only---\v"

softwares=("neofetch" "gnome-tweaks" "gdebi" "vlc" "libreoffice" "software-properties-common" "apt-transport-https" "wget" "curl" "thunderbird" "htop" "spotube" "spotify-client" "kodi" "timeshift" "telegram-desktop" "bleachbit")

for i in "${softwares[@]}"; do
    read -p "Do you wanna install $i? [y/n]: " choice
    case $choice in
    y | Y)
        case $i in
        spotify-client)
            echo -e "\v ---Installing $i---\v"
            curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
            echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
            sudo apt-get update
            sudo apt-get install $i
            ;;
        kodi)
            sudo add-apt-repository -y ppa:team-xbmc/ppa
            sudo apt update
            echo -e "\v ---Installing $i---\v"
            sudo apt install $i
            ;;
        timeshift)
            sudo add-apt-repository -y ppa:teejee2008/timeshift
            sudo apt update
            echo -e "\v ---Installing $i---\v"
            sudo apt install $i
            ;;
        libreoffice)
            sudo add-apt-repository ppa:libreoffice
            sudo apt update
            echo -e "\v ---Installing $i---\v"
            sudo apt install $i
            ;;
        *)
            echo -e "\v ---Installing $i---\v"
            sudo apt install $i
            ;;
        esac
        ;;
    n | N)
        echo -e "\v ---Skipping $i---\v"
        ;;
    *)
        echo "oh come on, just say y or n, it's not that hard"
        ;;
    esac
done

if which neofetch > /dev/null; then
    neofetch
fi
