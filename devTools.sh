#!/bin/bash

sudo apt update

devTools=("code" "mysql-server" "github-desktop" "android-studio" "flutter-sdk" "java" "nodejs" "python3" "python3-pip" "pipenv" "php" "bleachbit" "gimp" "gitkraken" "postman")
for i in "${devTools[@]}"; do
    read -p "Do you wanna install $i? [y/n]: " choice
    case $choice in
    y | Y)
        case $i in
        code)
            sudo apt-get install wget gpg
            wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
            sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
            sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
            rm -f packages.microsoft.gpg
            sudo apt install apt-transport-https
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
            sudo apt-get install -y ca-certificates curl gnupg
            curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
            NODE_MAJOR=20
            echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
            sudo apt-get update
            echo -e "\v ---Installing latest $i---\v"
            sudo apt-get install -y $i
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
            rm gitkraken-amd64.deb
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
