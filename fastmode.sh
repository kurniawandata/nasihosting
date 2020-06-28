echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo "Nasihosting [Fast mode] - v1.0 Beta 32 "
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
sudo ls -l /mnt/*
echo -n "Masukkan nama file img - Jangan lupa tambahkan ekstensi img, misal akun1.img : "
read img
if [[ $img =~ \.img$ ]]; then
echo -n "Masukkan nama sub domain : "
read namasubdomain
if [ -z "$(ls -A /mnt/$img)" ]; then
echo "Buat img.."
sudo dd if=/dev/zero of=/mnt/$img bs=1024 count=100000
sudo mkdir -p /home/$namasubdomain
sudo mkfs.ext4 /mnt/$img
sudo mount -o loop /mnt/$img /home/$namasubdomain
sudo nano /etc/fstab
echo "Salin file manager.."    
sudo rmdir /home/$namasubdomain/lost+found
sudo cp filemanager/* /home/$namasubdomain
sudo chmod -R 777 /home/$namasubdomain  
sudo chown www-data.www-data /home/$namasubdomain  
sudo chown www-data.www-data -R /home/$namasubdomain/*
sudo nano /home/$namasubdomain/config.php
echo "Installasi virtualhost dengan domain.."
sudo cp support/subdomain.conf /etc/apache2/sites-available/$namasubdomain.conf
sudo nano /etc/apache2/sites-available/$namasubdomain.conf
sudo a2ensite $namasubdomain.conf
sudo service apache2 restart
else
echo "File img sudah ada"
fi
else
echo "Anda lupa memasukkan ekstensi img"
fi
