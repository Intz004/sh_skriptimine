#!/bin/bash
PMA=/usr/share/phpmyadmin/
RED='\033[0;31m'
NC='\033[0m'
#PhpMyAdmin paigaldusskript

#Kontrollin kas Mariadb on paigaldatud
if command -v mariadb > /dev/null 2>&1; then
	echo "${RED} MariaDB olemas, liigun edasi ${NC}"
else
	sudo apt update
	sudo apt install mariadb-server mariadb-client -y
	echo "${RED}MariaDB paigaldatud, liigun edasi${NC}"
fi
#Kontrollin kas apache on paigaldatud
# kas Apache2 on juba varasemalt paigaldatud?d
if command -v apache2 >/dev/null 2>&1; then
	echo "Apache2 ei ole varasemalt paigaldatud, teen seda nüüd....."
    
    # Uuenda package listi
    	sudo apt update

    # Paigalda Apache2
    	sudo apt install -y apache2

    # Start Apache2 service
    	sudo systemctl start apache2

    # Enable Apache2 to start on boot
    	sudo systemctl enable apache2

   	 echo "${RED}Apache2 on nüüd paigaldatud ning töötab.${NC}"
else
    	echo "${RED}Apache2 on juba varasemalt paigaldatud.${NC}"
#	sudo systemctl status apache2
fi
if  -f "$PMA" ; then
	echo "${RED}PMA varasemalt juba paigaldatud${NC}"
else
	sudo apt install phpmyadmin
	echo "${RED}PMA paigaldatud!${NC}"
fi

