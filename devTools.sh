#!/bin/bash

sudo apt update

devTools=("code" "mysql-server" "github-desktop" "android-studio" "flutter-sdk" "java" "nodejs" "python3" "python3-pip" "pipenv" "php" "bleachbit" "gimp" "gitkraken" "postman")
for i in "${devTools[@]}"; do
    read -p "Do you wanna install $i? [y/n]: " choice
    case $choice in
    y | Y)
        case $i in
        code)
            wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
            sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
            sudo apt update
            echo -e "\v ---Installing $i---\v"
            sudo apt install -y $i
            ;;
        mysql-server)
            echo -e "\v ---Installing $i---\v"
            sudo apt install -y $i
            sudo systemctl start mysql.service
            ;;
        github-desktop)
            wget -qO - https://mirror.mwt.me/shiftkey-desktop/gpgkey | gpg --dearmor | sudo tee /etc/apt/keyrings/mwt-desktop.gpg >/dev/null
            sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/mwt-desktop.gpg] https://mirror.mwt.me/shiftkey-desktop/deb/ any main" > /etc/apt/sources.list.d/mwt-desktop.list'
            sudo apt update
            echo -e "\v ---Installing $i---\v"
            sudo apt install -y $i
            #flatpak install -y flathub io.github.shiftey.Desktop
            ;;
        android-studio)
            sudo snap install android-studio --classic
            ;;
        flutter-sdk)
            echo -e "\v ---Installing $i---\v"
            sudo snap install flutter --classic
            flutter doctor
            ;;
        java)
            echo -e "\v ---Installing $i---\v"
            sudo apt install -y default-jre
            sudo apt install -y default-jdk
            java -version
            ;;
        nodejs)
            curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash - &&\
            echo -e "\v ---Installing latest $i---\v"
            sudo apt install -y $i
            ;;
        gimp)
            sudo add-apt-repository ppa:otto-kesselgulasch/gimp
            sudo apt update
            echo -e "\v ---Installing $i---\v"
            sudo apt install -y $i
            ;;
        gitkraken)
            wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
            echo -e "\v ---Installing $i---\v"
            sudo apt install ./gitkraken-amd64.deb
            ;;
        postman)
            sudo snap install postman
            ;;
        *)
            echo -e "\v ---Installing $i---\v"
            sudo apt install -y $i
            ;;
        esac
        ;;
    n | N)
        echo -e "\v ---Skipping $i---\v"
        ;;
    *)
        echo "what?"
        ;;
    esac
done
