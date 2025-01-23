#!/bin/bash

sudo apt-get remove --purge mysql-server mysql-client mysql-common apache2 php7.0 libapache2-mod-php7.0 php7.0-mysql -y
sudo apt-get purge php7.*
sudo apt-get autoremove -y
sudo apt-get autoclean
sudo apt-get remove mysql-apt-config
sudo apt-get purge mysql-apt-config
sudo reboot

