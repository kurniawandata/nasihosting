#!/bin/bash
#Progammer : Kurniawan. kurniawan@xcodetraining.com. xcode.or.id.
#Program ini dapat digunakan untuk personal ataupun komersial.
#X-code Media - xcode.or.id / xcodetraining.com
again='y'
while [[ $again == 'Y' ]] || [[ $again == 'y' ]];
do
clear
echo "=================================================================";
echo " Nasihosting for Apache Server (Ubuntu Server)                   ";
echo " Progammer : Kurniawan. xcode.or.id                              ";
echo " Version 5.0 - 01/10/2021                                        ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " Instalasi                                                       ";
echo " [1]  Install PHP 8.0, salin phpinfo.php ke /var/www/html dan    ";
echo "      install MySQL Server                                       ";
echo " [2]  Install phpmyadmin 5.1.11 (Kompatible dengan PHP 8.0)       ";
echo " [3]  Aktifkan /home untuk virtualhost client, zip unzip php-zip ";
echo "      dan ganti domain nasihosting.com                           ";
echo " [4]  Lihat daftar file img di /mnt                              ";
echo " [5]  Cek folder untuk client hosting di /home                   ";
echo " [6]  Buat file img, mount, edit /etc/fstab/                     ";
echo " [7]  Cek isi folder client hosting                              ";
echo " [8]  Salin file manager pada folder untuk client hosting serta  ";
echo "      pengaturan hak aksesnya                                    ";
echo " [9]  Edit file /etc/fstab                                       ";
echo " [10] Edit password untuk login client                           ";
echo " [11] Cek mount                                                  ";
echo " [12] Umount file img dan edit /etc/fstab                        ";
echo " [13] Hapus data file img                                        ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " Aktifkan pengamanan dari remote shell PHP Shell                 ";
echo " [14] Cek php.ini di PHP 8.0 (/etc/apache2/php8.0/apache/php.ini)";
echo " [15] Amankan dari PHP Shell(/etc/apache2/php8.0/apache/php.ini) ";
echo " [16] Edit php.ini (/etc/apache2/php8.0/apache/php.ini)          ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " Virtualhost                                                     ";
echo " [17] Cek file virtualhost                                       ";
echo " [18] Buat file virtualhost, aktifkan, service apache2 restart   ";
echo " [19] Hapus file virtualhost                                     ";
echo " [20] Edit virtualhost dan service apache2 restart               ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " MySQL                                                           ";
echo " [21] Tambah user di MySQL dan buat databasenya                  ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " [22] Monitoring log dari domain / subdomain                     ";
echo " [23] Monitoring log dari ip address                             ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " [24] Exit                                                       ";
echo "=================================================================";
read -p " Masukkan Nomor Pilihan Anda antara [1 - 24] : " choice;
echo "";
case $choice in

1)  sudo apt-get update
    sudo apt -y install software-properties-common
    sudo add-apt-repository ppa:ondrej/php 
    sudo apt-get update
    sudo apt -y install php8.0 libapache2-mod-php8.0
    sudo cp support/phpinfo.php /var/www/html
    sudo apt install mysql-server
    echo -n "Masukkan password root yang akan dibuat : "
    read passmysql
    sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$passmysql';" 
    sudo clear
    service apache2 restart
    read -p "Tekan enter untuk restart, setelah restart cek phpinfo.php di browser, bisa dipanggil lewat ip address/phpinfo.php"
    ;;

2) sudo apt install phpmyadmin
    sudo mv /usr/share/phpmyadmin/ /usr/share/phpmyadmin.bak
    sudo mkdir /usr/share/phpmyadmin/
    sudo wget https://files.phpmyadmin.net/phpMyAdmin/5.1.1/phpMyAdmin-5.1.1-all-languages.tar.gz
    sudo tar xzf phpMyAdmin-5.1.1-all-languages.tar.gz
    sudo mv phpMyAdmin-5.1.1-all-languages/* /usr/share/phpmyadmin
    cp support/vendor_config.php /usr/share/phpmyadmin/libraries/
    ;;

3)  echo "Aktifkan /home.."
    sudo cp /etc/apache2/apache2.conf backup
    sudo cp support/apache2.conf /etc/apache2/
    sudo apt-get install zip unzip php-zip
    echo -n "Masukkan nama domain : "
    read domain
    sed -i "s/nasihosting.com/$domain/g" support/subdomain.conf
    service apache2 restart
    ;;

4)  sudo ls -l /mnt/
    ;;

5)  echo -n "Masukkan nama sub domain "
    read namasubdomain
    if [ -z "$(ls -A /home/$namasubdomain/*)" ]; then
    echo "folder untuk sub domain yang anda masukkan belum ada"
    else
    echo "Folder untuk sub domain yang anda masukkan sudah ada"
    fi
    ;;   

6)  sudo ls -l /mnt/*
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
    sudo nano /etc/fstab
    else
    echo "File img sudah ada"
    fi
    else
    echo "Anda lupa memasukkan ekstensi img"
    fi
    ;;
7)  echo -n "Masukkan alamat sub domain : "
    read namasubdomain
    if [ -z "$(ls -A /home/$namasubdomain/*)" ]; then
    echo "Anda belum buat folder dengan nama sub domain tersebut"
    else
    sudo ls -l /home/$namasubdomain/
    fi
    ;;

8)  echo -n "Masukkan alamat sub domain : "
    read namasubdomain
    if [ -z "$(ls -A /home/$namasubdomain/*)" ]; then
    sudo rmdir /home/$namasubdomain/lost+found
    sudo cp filemanager/* /home/$namasubdomain
    sudo chmod -R 777 /home/$namasubdomain  
    sudo chown www-data.root /home/$namasubdomain  
    sudo chown www-data.root -R /home/$namasubdomain/*
    else
    echo "Anda belum buat folder dengan nama sub domain tersebut"
    fi
    ;;


9)  sudo nano /etc/fstab
    ;;

10)  echo -n "Masukkan alamat sub domain : "
    read namasubdomain
    if [ -z "$(ls -A /home/$namasubdomain/*)" ]; then
    echo "Anda belum buat folder dengan nama sub domain tersebut"
    else
    sudo nano /home/$namasubdomain/config.php
    fi
    ;;


11)  sudo mount
    ;;

12)  sudo ls -l /mnt/*
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

13) read -p "Apakah anda yakin akan menghapus file img client ? y/n :" -n 1 -r
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

14) if [ -z "$(ls -l /etc/php/8.0/apache2/php.ini)" ]; then
    echo "File php.ini tidak ada di /etc/php/8.0/apache2/php.ini"
    else
    echo "File php.ini ada di /etc/php/8.0/apache2/php.ini" 
    fi
    ;;

15) read -p "Apakah anda yakin menggunakan apache server dengan PHP 8.0? y/n :" -n 1 -r
    echo  ""
    if [[ ! $REPLY =~ ^[Nn]$ ]]
    then
    if [ -z "$(ls -l /etc/php/8.0/apache2/php.ini)" ]; then
    echo "File php.ini tidak ada di /etc/php/8.0/apache2/php.ini"
    else
    sudo cp /etc/php/8.0/apache2/php.ini /etc/php/8.0/apache2/phpini.backup
    sudo cp support/php.ini /etc/php/8.0/apache2
    sudo service apache2 restart
    fi
    fi
    ;;

16) if [ -z "$(ls -l /etc/php/8.0/apache2/php.ini)" ]; then
    echo "File php.ini tidak ada di /etc/php/8.0/apache2/php.ini"
    else
    sudo nano /etc/php/8.0/apache2/php.ini
    fi
    ;;


17) echo -n "Masukkan alamat sub domain : "
    read namasubdomain
    if [ -z "$(ls -A /etc/apache2/sites-available/$namasubdomain.conf)" ]; then
    echo "Anda belum buat virtualhost dengan nama sub domain tersebut"
    else
    echo "Anda sudah membuat virtualhost dengan nama sub domain tersebut"
    fi
    ;;

18) echo -n "Masukkan alamat sub domain : "
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

19) echo -n "Masukkan alamat sub domain : "
    read namasubdomain
    if [ -z "$(ls -A /etc/apache2/sites-available/$namasubdomain.conf)" ]; then
    echo "Anda belum buat virtualhost dengan nama sub domain tersebut"
    else
    sudo rm /etc/apache2/sites-available/$namasubdomain.conf
    fi
    ;;

20) echo -n "Masukkan alamat sub domain : "
    read namasubdomain
    if [ -z "$(ls -A /etc/apache2/sites-available/$namasubdomain.conf)" ]; then
    echo "Anda belum buat virtualhost dengan nama sub domain tersebut"
    else
    sudo nano /etc/apache2/sites-available/$namasubdomain.conf
    sudo service apache2 restart
    fi
    ;;

21) echo -n "Masukkan password root pada mysql : "
    read passmysql
    echo -n "Masukkan nama user akun mysql yang akan dibuat : "
    read namauser
    echo -n "Masukkan password untuk nama user akun mysql yang akan dibuat : "
    read passdb
    echo -n "Masukkan nama database yang akan dibuat untuk user yang akan dibuat : "
    read namadatabase
    sudo mysql -uroot -p$passmysql -e "CREATE DATABASE $namadatabase"
    sudo mysql -uroot -p$passmysql -e "GRANT ALL PRIVILEGES ON $namadatabase.* TO $namauser@localhost IDENTIFIED BY '$passdb'"
    sudo mkdir /home/$namadatabase
    sudo touch /home/$namadatabase/locked
    sudo clear
    ;;

22) sudo tail -f /var/log/apache2/other_vhosts_access.log
    ;;

23) sudo tail -f /var/log/apache2/access.log
    ;;

24) exit
    ;;
*)    echo "Maaf, menu tidak ada"
esac
echo ""
echo "Nasihosting for apache server (Ubuntu Server)"
echo "Oleh Kurniawan. xcode.or.id. E-mail : kurniawanajazenfone@gmail.com"
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
