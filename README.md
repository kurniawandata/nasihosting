# nasihosting

Nasihosting v1.0 Beta 32
--------------------
![alt text](http://xcode.or.id/04_small-logo.png)

Script untuk mendukung otomatisasi akun hosting dengan apache server di Ubuntu Server

Jangan menggunakan PHP di bawah versi 7.4
-------------------------
Jangan install PHP di bawah versi 7.4, jika punya server, pastikan install php 7.4, instalasi PHP 7.4 sudah disertakan dalam program,  jika anda sudah pakai PHP versi sebelumnya maka lakukan remove dan pastikan nanti PHP 7.4 yang berjalan.

File manager
------------
File manager yang digunakan adalah Tiny File Manager dengan sumber dari https://github.com/prasathmani/tinyfilemanager

Penggantian password cukup pada config.php

Untuk generate password :
https://tinyfilemanager.github.io/docs/pwd.html

Cara menggunakan
----------------
1. git clone https://github.com/kurniawandata/nasihosting
2. cd nasihosting
3. chmod -R 777 *
4. ./nasihosting.sh
5. Jika sudah tidak ada masalah dengan nasihosting.sh, seperti sudah menggunakan PHP 7.4 dan sebagainya yang diperlukan maka bisa menggunakan fast mode, cara penggunaannya cukup ketik ./fastmode.sh (Jangan lupa jika tidak ingin menggunakan default storage untuk client 100 MB maka edit programnya).


Keterangan
----------
1. Di script ini default-nya membuat file ekstensi img 100 MB jika ingin mengubah, bisa edit scriptnya
1. Saat masuk di /etc/fstab, masukkan : /mnt/namafile.img /home/sample ext4 loop 1 2 (namafile.img bisa diganti bebas namanya asal ada ekstensi img)
3. Kata sample di atas bisa diganti dengan nama sub domain yang akan dibuat
4. Di virtualhost ganti sample dengan melakukan find dan replace all dengan nama sub domain yang akan dibuat (Jika di linux pakai nano bisa menggunakan ctrl + backslash

Script ini telah diimplementasi
-------------------------------
Anda bisa mengakses nasihosting di https://nasihosting.com

Demo video
----------
https://www.youtube.com/watch?v=sbM_NbdWWeg


Licensi
-------
GNU General Public License v3

Program ini dibuat oleh :
--------------------------------------------
Kurniawan. trainingxcode@gmail.com.
xcode.or.id


Donasi :
--------
Jika ingin donasi untuk Kurniawan

Gopay :

![alt text](http://xcodeserver.my.id/gofood.png)

![alt text](http://xcodeserver.my.id/gopay.png)

Ovo :

![alt text](http://xcodeserver.my.id/ovo3.png)

![alt text](http://xcodeserver.my.id/ovo2.png)

Jika sudah donasi bisa whatsapp ke kurniawan untuk konfirmasi : 0858 0394 6032

Daftar donator : https://xcode.or.id/donation

Untuk nama donator bisa ditulis nama pribadi, nama usaha atau semacamnya, jika tidak ingin ditampilkan siapa yang mengirimkan donasi maka akan ditulis anonim.
