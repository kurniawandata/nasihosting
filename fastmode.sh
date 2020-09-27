#!/bin/bash
#Progammer : Kurniawan. kurniawan@xcodetraining.com. xcode.or.id.
#Program ini dapat digunakan untuk personal ataupun komersial.
#X-code Media - xcode.or.id / xcodetraining.com
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo "Nasihosting [Fast mode] - v1.5         "
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
sudo ls -l /mnt/*
echo -n "Masukkan nama file img - Jangan lupa tambahkan ekstensi img, misal akun1.img : "
read img
if [[ $img =~ \.img$ ]]; then
echo -n "Masukkan nama sub domain : "
read namasubdomain
if [ -z "$(ls -A /mnt/$img)" ]; then
echo "Buat img.."
sudo dd if=/dev/zero of=/mnt/$img bs=1024 count=150000
sudo mkdir -p /home/$namasubdomain
sudo mkfs.ext4 /mnt/$img
sudo mount -o loop /mnt/$img /home/$namasubdomain
sed -i -e '$a/mnt/'$img' /home/'$namasubdomain' ext4 loop 1 2' /etc/fstab
echo "Salin file manager.."    
sudo rmdir /home/$namasubdomain/lost+found
sudo cp filemanager/* /home/$namasubdomain
sudo chmod -R 777 /home/$namasubdomain  
sudo chown www-data.www-data /home/$namasubdomain  
sudo chown www-data.www-data -R /home/$namasubdomain/*
echo -n "Masukkan password file manager : "
read passlogin
sed -i "s/gantipasswordnya/$passlogin/g" /home/$namasubdomain/config.php
echo "Installasi virtualhost dengan domain.."
sudo cp support/subdomain.conf /etc/apache2/sites-available/$namasubdomain.conf
sed -i "s/sample/$namasubdomain/g" /etc/apache2/sites-available/$namasubdomain.conf
sudo a2ensite $namasubdomain.conf
sudo service apache2 restart
echo -n "Masukkan password root pada mysql : "
read passmysql
echo -n "Masukkan nama user akun mysql yang akan dibuat : "
read namauser
echo -n "Masukkan password untuk nama user akun mysql yang akan dibuat : "
read passdb
echo -n "Masukkan nama database yang akan dibuat untuk user yang akan dibuat : "
read namadatabase
sudo mysql -uroot -p$passmysql -e "CREATE DATABASE $namadatabase"
sudo mysql -uroot -p$passmysql -e "GRANT ALL PRIVILEGES ON $namadatabase.* TO $namauser@localhost IDENTIFIED BY '$passdb'"
sudo clear
else
echo "File img sudah ada"
fi
else
echo "Anda lupa memasukkan ekstensi img"
fi
