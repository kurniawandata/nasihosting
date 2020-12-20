#!/bin/bash
sudo a2enmod ssl
sudo mkdir /etc/apache2/ssl
sudo chmod 777 /etc/apache2/ssl
sudo nano /etc/apache2/ssl/nasihosting.com.pem
sudo nano /etc/apache2/ssl/nasihosting.com.key
service apache2 restart
