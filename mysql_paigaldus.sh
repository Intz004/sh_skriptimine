#!/bin/bash

# Kas MySQLl varasemalt paigaldatud?d
if command -v mysql > /dev/null 2>&1; then

# Paigaldame MySQL-serveri ning vajadusel ka vajalikud PHP paketid.
    echo "MySQL server on sellel masinal juba paigaldatud"
    echo "Sisesta root kasutaja parool:"
    mysql -u root -p
else
    echo "MySQL server puudub sellel masinal, kuid asun kohe seda paigaldama sinu eest...."
    # Uuenda package listi
    sudo apt update

    # Paigalda mysql-server
    sudo apt install gnupg -y
    sudo wget https://dev.mysql.com/get/mysql-apt-config_0.8.30-1_all.deb
    sudo dpkg -i mysql-apt-config_0.8.30-1_all.deb
    sudo apt install mysql-server -y
    #my.cnf konfiguratsioon
        touch $HOME/.my.cnf
        echo "[CLIENT]" >> $HOME/.my.cnf
        echo "host = localhost" >> $HOME/.my.cnf
        echo "user = root" >> $HOME/.my.cnf
        echo "password = qwerty" >> $HOME/.my.cnf

    # Paigalda PHP ja vajalikud paketid MySQL jaoks
    if command -v php > /dev/null 2>&1; then
    echo "Vajalikud PHP paketid on juba varasemalt paigaldatud, super, hoian aega kokku..."
else
    echo "Tundub et sul on puudu mõningad php paketid, ole mureta lisan need kohe..."
    sudo apt install -y php php-mysql php-cli php-fpm php-mbstring php-xml php-zip
    #käivitame mysql
    echo "Sisesta root parool mille just määrasid:"
	mysql -u root -p
fi
fi
