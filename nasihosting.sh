#!/bin/bash
#Progammer : Kurniawan. trainingxcode@gmail.com. xcode.or.id.
#Program ini dapat digunakan untuk personal ataupun komersial.
#X-code Media - xcode.or.id / xcodetraining.com
again='y'
while [[ $again == 'Y' ]] || [[ $again == 'y' ]];
do
clear
echo "=================================================================";
echo " Nasihosting for X-code (Ubuntu server 16.04) - Beta 1           ";
echo " Progammer : Kurniawan. xcode.or.id                              ";
echo " Version 1.0.0 - 19/06/2020                                      ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " Instalasi                                                       ";
echo " [1] Aktifkan /home pada /etc/apache2/apache2.conf               ";
echo " [2] Lihat daftar file img                                       ";
echo " [3] Cek folder untuk client hosting                             ";
echo " [4] Buat file img, edit /etc/fstab/, mount dan salin data       ";
echo " [5] Edit file /etc/fstab                                        ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " Virtual host                                                    ";
echo " [6] Buat virtuahost                                             ";
echo " [7] Edit virtualhost                                            ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " [8] Exit                                                        ";
echo "=================================================================";
read -p " Masukkan Nomor Pilihan Anda antara [1 - 8] : " choice;
echo "";
case $choice in

1)  echo "Aktifkan /home.."
    sudo cp /etc/apache2/apache2.conf backup
    sudo cp support/apache2.conf /etc/apache2/
    ;;
2)  sudo ls -l /mnt/
    ;;

3)  echo -n "Masukkan nama sub domain "
    read namasubdomain
    if [ -z "$(ls -A /home/$namasubdomain/*)" ]; then
    echo "folder untuk sub domain yang anda masukkan belum ada"
    else
    echo "Folder untuk sub domain yang anda masukkan sudah ada"
    fi
    ;;   

4)  sudo ls -l /mnt/*
    echo -n "Masukkan nama file img : "
    read img
    echo -n "Masukkan nama sub domain : "
    read namasubdomain
    if [ -z "$(ls -A /mnt/$img)" ]; then
    echo "Buat img.."
    sudo dd if=/dev/zero of=/mnt/$img bs=1024 count=10000
    sudo mkdir -p /home/$namasubdomain
    sudo mkfs.ext4 /mnt/$img
    sudo mount -o loop /mnt/$img /home/$namasubdomain
    sudo nano /etc/fstab
    sudo rmdir /home/$namasubdomain/lost+found
    sudo cp /home/gudang/* /home/$namasubdomain
    sudo chmod -R 777 /home/$namasubdomain  
    sudo chown www-data.www-data /home/$namasubdomain  
    sudo chown www-data.www-data -R /home/$namasubdomain
    else
    echo "File img yang anda masukkan sudah ada"
    fi
    ;;   

5)  sudo nano /etc/fstab
    ;;
6)  echo -n "Masukkan alamat sub domain : "
    read namasubdomain
    if [ -z "$(ls -A /home/$namasubdomain/*)" ]; then
    echo "Sub domain yang anda masukkan sudah ada"
    else
    echo "Installasi virtualhost dengan domain"
    sudo cp support/subdomain.conf /etc/apache2/sites-available/$namasubdomain.conf
    sudo nano /etc/apache2/sites-available/$namasubdomain.conf
    sudo a2ensite $namasubdomain.conf
    sudo service apache2 reload
    fi
    ;;   
    
7)  echo -n "Masukkan alamat domain / subdomain : "
    read namasubdomain
    if [ -z "$(ls -A /etc/apache2/sites-available/$namasubdomain.conf)" ]; then
    echo "Anda belum buat virtualhost dengan nama sub domain tersebut"
    else
    sudo nano /etc/apache2/sites-available/$namasubdomain.conf
    fi
    ;;

8) exit
    ;;
*)    echo "Maaf, menu tidak ada"
esac
echo ""
echo "Nasihosting for X-code (Ubuntu Server 16.04) Beta 1"
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
