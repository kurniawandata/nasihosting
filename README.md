# nasihosting

Nasihosting v1.0 Beta 24
--------------------
![alt text](http://xcode.or.id/04_small-logo.png)

Script untuk mendukung otomatisasi akun hosting dengan apache server di Ubuntu Server

Jangan menggunakan PHP di bawah versi 7.4
-------------------------
Jangan install PHP di bawah versi 7.4, jika punya server, pastikan install php 7.4, instalasi PHP 7.4 sudah disertakan dalam program, jika anda sudah pakai PHP versi s$

File manager
------------
Sumber : https://github.com/prasathmani/tinyfilemanager

Cara menggunakan
----------------
1. git clone https://github.com/kurniawandata/nasihosting
2. cd nasihosting
3. chmod -R 777 *
4. ./nasihosting.sh

Keterangan
----------
1. Di script ini default-nya membuat file ekstensi img 100 MB jika ingin mengubah, bisa edit scriptnya
1. Saat masuk di /etc/fstab, masukkan : /mnt/namafile.img /home/sample ext4 loop 1 2 (namafile.img bisa diganti bebas namanya asal ada ekstensi img)
3. Kata sample di atas bisa diganti dengan nama sub domain yang akan dibuat
4. Di virtualhost ganti sample dengan melakukan find dan replace all dengan nama sub domain yang akan dibuat (Jika di linux pakai nano bisa menggunakan ctrl + backslas$

Script ini telah diimplementasi
-------------------------------
Anda bisa mengakses nasihosting di https://nasihosting.com

Licensi
-------
GNU General Public License

Program ini dibuat oleh :
--------------------------------------------
Kurniawan. trainingxcode@gmail.com.
xcode.or.id


Donasi :
--------
Jika ingin donasi untuk Kurniawan

![alt text](http://xcodeserver.my.id/gofood.png)

![alt text](http://xcodeserver.my.id/gopay.png)
