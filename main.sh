#!/bin/bash

echo -e "\v What do you want today?\v"

if which flatpak >/dev/null || which snap >/dev/null; then
    echo "Looking good! Flatpak and Snap already installed"
else
    echo "Flatpak or Snap is not installed :| Some softwares are only available from their repo and this script uses it."
    source ./package-managers.sh
fi

state=0
while [ $state -eq 0 ]; do

    echo -e "\v 1. Common softwares\v 2. Developer tools\v 3. Gaming tools\v 4. pip packages\v 5. exit\v"

    read -p "Enter your choice: " choice
    case $choice in
    1)
        source ./apt.sh
        ;;
    2)
        source ./devTools.sh
        ;;
    3)
        source ./gameMode.sh
        ;;
    4)
        source ./pip.sh
        ;;
    5)
        echo -e "\v Don't die :)\v"
        state=1
        ;;
    *)
        echo -e "\v We don't have your imaginary choice - $choice. Give is another try\v"
        ;;
    esac
done
