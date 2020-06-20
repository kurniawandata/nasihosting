#!/bin/bash
#Progammer : Kurniawan. trainingxcode@gmail.com. xcode.or.id.
#Program ini dapat digunakan untuk personal ataupun komersial.
#X-code Media - xcode.or.id / xcodetraining.com
again='y'
while [[ $again == 'Y' ]] || [[ $again == 'y' ]];
do
clear
echo "=================================================================";
echo " Nasihosting for X-code for Ubuntu server 16.04                  ";
echo " Progammer : Kurniawan. xcode.or.id                              ";
echo " Version 1.0 Beta 11 - 20/06/2020                                ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " Instalasi                                                       ";
echo " [1]  Aktifkan /home, zip unzip php-zip, install PHP 7.4         ";
echo " [2]  Lihat daftar file img                                      ";
echo " [3]  Cek folder untuk client hosting                            ";
echo " [4]  Buat file img, mount, edit /etc/fstab/                     ";
echo " [5]  Cek isi folder client hosting                              ";
echo " [6]  Salin file manager pada folder untuk client hosting        ";
echo " [7]  Edit file /etc/fstab                                       ";
echo " [8]  Cek mount                                                  ";
echo " [9]  Umount file img dan edit /etc/fstab                        ";
echo " [10] Hapus data file img                                        ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " Aktifkan pengamanan dari remote shell PHP Shell                 ";
echo " [11] Amankan dari PHP Shell                                     ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " Virtual host                                                    ";
echo " [12] Buat virtualhost                                           ";
echo " [13] Hapus virtualhost                                          ";
echo " [14] Edit virtualhost                                           ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " [15] Exit                                                       ";
echo "=================================================================";
read -p " Masukkan Nomor Pilihan Anda antara [1 - 15] : " choice;
echo "";
case $choice in

1)  echo "Aktifkan /home.."
    sudo cp /etc/apache2/apache2.conf backup
    sudo cp support/apache2.conf /etc/apache2/
    sudo apt-get install zip unzip php-zip
    sudo apt-get update
    sudo apt -y install software-properties-common
    sudo add-apt-repository ppa:ondrej/php 
    sudo apt-get update
    sudo apt -y install php7.4
    service apache2 restart
    read -p "Tekan enter untuk restart"
    reboot
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
    echo -n "Masukkan nama file img - Jangan lupa tambahkan ekstensi img, misal akun1.img : "
    read img
    echo -n "Masukkan nama sub domain : "
    read namasubdomain
    if [ -z "$(ls -A /mnt/$img)" ]; then
    echo "Buat img.."
    sudo dd if=/dev/zero of=/mnt/$img bs=1024 count=100000
    sudo mkdir -p /home/$namasubdomain
    sudo mkfs.ext4 /mnt/$img
    sudo mount -o loop /mnt/$img /home/$namasubdomain
    sudo nano /etc/fstab
    else
    echo "File img sudah ada"
    fi
    ;;   

5)  echo -n "Masukkan alamat domain / subdomain : "
    read namasubdomain
    if [ -z "$(ls -A /home/$namasubdomain/*)" ]; then
    echo "Anda belum buat folder dengan nama sub domain tersebut"
    else
    sudo ls -l /home/$namasubdomain/
    fi
    ;;

6)  echo -n "Masukkan alamat domain / subdomain : "
    read namasubdomain
    if [ -z "$(ls -A /home/$namasubdomain/*)" ]; then
    sudo rmdir /home/$namasubdomain/lost+found
    sudo cp /home/gudang/* /home/$namasubdomain
    sudo chmod -R 777 /home/$namasubdomain  
    sudo chown www-data.www-data /home/$namasubdomain  
    sudo chown www-data.www-data -R /home/$namasubdomain/*
    else
    echo "Anda belum buat folder dengan nama sub domain tersebut"
    fi
    ;;
  
7)  sudo nano /etc/fstab
    ;;

8)  sudo mount
    ;;

9)  sudo ls -l /mnt/*
    echo -n "Masukkan nama file img - Jangan lupa tambahkan ekstensi img, misal akun1.img : "
    read img
    echo -n "Masukkan nama sub domain : "
    read namasubdomain
    if [ -z "$(ls -A /mnt/$img)" ]; then
    echo "File img tidak ada"
    else
    echo "umount pada file img.."
    sudo umount /mnt/$img
    sudo nano /etc/fstab    
    fi
    ;;

10) read -p "Apakah anda yakin akan menghapus file img client ? y/n :" -n 1 -r
    echo  ""
    if [[ ! $REPLY =~ ^[Nn]$ ]]
    then
    sudo ls -l /mnt
    echo -n "Masukkan nama file img  - Jangan lupa tambahkan ekstensi img, misal akun1.img : "
    read img
    if [ -z "$(ls -l /mnt/$img)" ]; then
    echo "Tidak ada file img tersebut"
    else
    sudo rm /mnt/$img
    echo "File img sudah dihapus"
    fi
    fi
    ;;

11) read -p "Apakah anda yakin menggunakan apache server dengan PHP 7.4? y/n :" -n 1 -r
    echo  ""
    if [[ ! $REPLY =~ ^[Nn]$ ]]
    then
    if [ -z "$(ls -l /etc/php/7.4/apache2/php.ini)" ]; then
    echo "Anda tidak menggunakan apache server dengan PHP 7.4"
    else
    sudo cp /etc/php/7.4/apache2/php.ini /etc/php/7.4/apache2/phpini.backup
    sudo cp support/php.ini /etc/php/7.4/apache2
    sudo service apache2 restart
    fi
    fi
    ;;


12) echo -n "Masukkan alamat sub domain : "
    read namasubdomain
    if [ -z "$(ls -A /etc/apache2/sites-available/$namasubdomain.conf)" ]; then
    echo "Installasi virtualhost dengan domain"
    sudo cp support/subdomain.conf /etc/apache2/sites-available/$namasubdomain.conf
    sudo nano /etc/apache2/sites-available/$namasubdomain.conf
    sudo a2ensite $namasubdomain.conf
    sudo service apache2 restart
    else
    echo "Sub domain yang anda masukkan sudah ada"
    fi
    ;;   

13) echo -n "Masukkan alamat domain / subdomain : "
    read namasubdomain
    if [ -z "$(ls -A /etc/apache2/sites-available/$namasubdomain.conf)" ]; then
    echo "Anda belum buat virtualhost dengan nama sub domain tersebut"
    else
    sudo rm /etc/apache2/sites-available/$namasubdomain.conf
    fi
    ;;

14) echo -n "Masukkan alamat domain / subdomain : "
    read namasubdomain
    if [ -z "$(ls -A /etc/apache2/sites-available/$namasubdomain.conf)" ]; then
    echo "Anda belum buat virtualhost dengan nama sub domain tersebut"
    else
    sudo nano /etc/apache2/sites-available/$namasubdomain.conf
    sudo service apache2 restart
    fi
    ;;


15) exit
    ;;
*)    echo "Maaf, menu tidak ada"
esac
echo ""
echo "Nasihosting for X-code v1.0 Beta 11 - Ubuntu Server 16.04"
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
