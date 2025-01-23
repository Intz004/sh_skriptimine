#!/bin/bash

# Check if PHP is installed
if command -v php > /dev/null 2>&1; then
    echo "PHP on juba paigaldatud"
else
    echo "PHP ei ole veel paigaldatud, kuid kohe teen seda..."

    # Uuenda package listi
    sudo apt update

    # Paigalda PHP ning muud vajalikud PHP paketid MySQLi jaoks
    sudo apt install -y php php-cli php-mysql php-common

    # Verify installation
    if command -v php > /dev/null 2>&1; then
        echo "Sain hakkama, PHP paigaldus oli edukas"
    else
        echo "Ei saanud hakkama, paigaldamisel esines tõrge"
        exit 1
    fi
fi
