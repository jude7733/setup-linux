#!/bin/bash

gameTools=("wine" "steam" "lutris" "playonlinux" "heroicgameslauncher" "discord")
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
        steam)
            sudo apt install wget
            wget http://repo.steampowered.com/steam/archive/stable/steam.gpg
            sudo cp steam.gpg /usr/share/keyrings/
            sudo tee /etc/apt/sources.list.d/steam-stable.list <<'EOF'
deb [arch=amd64,i386 signed-by=/usr/share/keyrings/steam.gpg] https://repo.steampowered.com/steam/ stable steam
deb-src [arch=amd64,i386 signed-by=/usr/share/keyrings/steam.gpg] https://repo.steampowered.com/steam/ stable steam
EOF
            sudo dpkg --add-architecture i386
            sudo apt-get update
            sudo apt-get install \
                libgl1-mesa-dri:amd64 \
                libgl1-mesa-dri:i386 \
                libgl1-mesa-glx:amd64 \
                libgl1-mesa-glx:i386 \
                steam-launcher
            ;;
        lutris)
            sudo add-apt-repository ppa:lutris-team/lutris
            sudo apt update
            echo -e "\v ---Installing $i---\v"
            sudo apt install lutris
            ;;
        heroicgameslauncher)
            flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
            flatpak install flathub com.heroicgameslauncher.hgl
            ;;
        discord)
            wget https://discord.com/api/download?platform=linux &
            format=deb
            echo -e "\v ---Installing $i---\v"
            sudo dpkg -i discord-0.0.13.deb
            # sudo snap install discord
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
        echo "Do you wanna play or not?, just say y or n"
        ;;
    esac
done
