#!/bin/bash

# kas Apache2 on juba varasemalt paigaldatud?d
if ! command -v apache2 >/dev/null 2>&1; then
    echo "Apache2 ei ole varasemalt paigaldatud, teen seda nüüd....."
    
    # Uuenda package listi
    sudo apt update

    # Paigalda Apache2
    sudo apt install -y apache2

    # Start Apache2 service
    sudo systemctl start apache2

    # Enable Apache2 to start on boot
    sudo systemctl enable apache2

    echo "Apache2 on nüüd paigaldatud ning töötab."
else
    echo "Apache2 on juba varasemalt paigaldatud."
	sudo systemctl status apache2
fi
