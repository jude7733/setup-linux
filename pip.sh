#!/bin/bash

python3 -m pip install --upgrade pip

echo -e "\v ---This script is for python/pip packages---\v"

packages=("notebook" "numpy" "pandas" "matplotlib" "seaborn" "scikit-learn" "tk" "pygame" "pygame-menu")

for i in "${packages[@]}"; do
    read -p "Do you wanna install $i? [y/n]: " choice
    case $choice in
    y | Y)
        case $i in
        tk)
            echo -e "\v ---Installing $i---\v"
            sudo apt-get install python3-tk
            sudo apt-get install python3-pil python3-pil.imagetk
            ;;
        *)
            echo -e "\v ---Installing $i---\v"
            pip install $i
            ;;
        esac
        ;;
    n | N)
        echo -e "\v ---Skipping $i---\v"
        ;;
    *)
        echo "you failed to click y/n, skipping $i"
        ;;
    esac
done
