#!/bin/bash

#add 32 bit architecture
sudo dpkg --add-architecture i386
sudo add-apt-repository multiverse

gameTools=("wine" "steam" "lutris" "playonlinux")
for i in "${gameTools[@]}"; do
    read -p "Do you wanna install $i? [y/n]: " choice
    case $choice in
    y | Y)
        case $i in
        wine)
            echo -e "\v ---Installing $i---\v"
            wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
            sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ impish main'
            sudo apt update
            sudo apt install --install-recommends winehq-stable
            wine --version
            ;;
        lutris)
            sudo add-apt-repository ppa:lutris-team/lutris
            sudo apt update
            echo -e "\v ---Installing $i---\v"
            sudo apt install lutris
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
#wget https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.5.2/heroic_2.5.2_amd64.deb
#sudo apt install ./heroic_2.5.2_amd64.deb
#flatpak install flathub com.heroicgameslauncher.hgl
