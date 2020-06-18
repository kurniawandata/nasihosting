#!/bin/bash
#Progammer : Kurniawan. trainingxcode@gmail.com. xcode.or.id.
#Program ini dapat digunakan untuk personal ataupun komersial.
#X-code Media - xcode.or.id / xcodetraining.com
again='y'
while [[ $again == 'Y' ]] || [[ $again == 'y' ]];
do
clear
echo "=================================================================";
echo " Nasihosting for X-code (Ubuntu server) - Beta 1                   ";
echo " Progammer : Kurniawan. xcode.or.id                              ";
echo " Version 1.0.0 - 19/10/2020                                      ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " Instalasi                                                       ";
echo " [1] Lihat daftar file img                                       ";
echo " [2] Buat folder untuk client hosting                            ";
echo " [3] Buat file img, edit /etc/fstab/, mount dan salin data       ";
echo " [4] Edit file /etc/fstab                                        ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " Virtual host                                                    ";
echo " [5] Buat virtuahost                                             ";
echo " [6] Edit virtualhost                                            ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " [7] Exit                                                        ";
echo "=================================================================";
read -p " Masukkan Nomor Pilihan Anda antara [1 - 7] : " choice;
echo "";
case $choice in

1)  sudo ls -l /mnt/
    ;;

2)  echo -n "Masukkan nama sub domain "
    read namasubdomain
    if [ -z "$(ls -A /var/www/html/$namasubdomain/*)" ]; then
    echo "Buat folder.."
    sudo mkdir -p /var/www/html/$namasubdomain
    else
    echo "Domain yang anda masukkan sudah ada"
    fi
    ;;   

3)  sudo ls -l /mnt/*
    echo -n "Masukkan nama file img : "
    read img
    echo -n "Masukkan nama sub domain : "
    read namasubdomain
    if [ -z "$(ls -A /mnt/$img)" ]; then
    echo "Buat img.."
    sudo dd if=/dev/zero of=/mnt/$img bs=1024 count=10000
    sudo mkdir -p /var/www/html/$namasubdomain
    sudo mkfs.ext4 /mnt/$img
    sudo mount -o loop /mnt/$img /var/www/html/$namasubdomain
    sudo nano /etc/fstab
    sudo rm /var/www/html/$namasubdomain/*
    sudo cp /home/gudang/* /var/www/html/$namasubdomain
    sudo chmod -R 777 /var/www/html/$namasubdomain  
    sudo chown -r www-data.www-data /var/www/html/$namasubdomain  
    sudo chown www-data.www-data -R /var/www/html/$namasubdomain
    else
    echo "File img yang anda masukkan sudah ada"
    fi
    ;;   

4)  sudo nano /etc/fstab
    ;;
5)  echo -n "Masukkan alamat sub domain : "
    read namasubdomain
    if [ -z "$(ls -A /var/www/html/$namasubdomain/*)" ]; then
    echo "Installasi virtualhost dengan domain"
    sudo cp support/subdomain.conf /etc/apache2/sites-available/$namasubdomain.conf
    sudo nano /etc/apache2/sites-available/$namasubdomain.conf
    sudo a2ensite $namasubdomain.conf
    sudo service apache2 reload
    else
    echo "Sub domain yang anda masukkan sudah ada"
    fi
    ;;   
    
6)  echo -n "Masukkan alamat domain / subdomain : "
    read namasubdomain
    if [ -z "$(ls -A /etc/apache2/sites-available/$namasubdomain.conf)" ]; then
    sudo nano /etc/apache2/sites-available/$namasubdomain.conf
    else
    echo "Sub domain yang anda masukkan belum ada"
    fi
    ;;

7) exit
    ;;
*)    echo "Maaf, menu tidak ada"
esac
echo ""
echo "Nasihosting for X-code (Ubuntu Server) Beta 1"
echo "Oleh Kurniawan - trainingxcode@gmail.com. xcode.or.id"
echo ""
echo -n "Kembali ke menu? [y/n]: ";
read again;
while [[ $again != 'Y' ]] && [[ $again != 'y' ]] && [[ $again != 'N' ]] && [[ $again != 'n' ]];
do
echo "Masukkan yang anda pilih tidak ada di menu";
echo -n "Kembali ke menu? [y/n]: ";
read again;
done
done
