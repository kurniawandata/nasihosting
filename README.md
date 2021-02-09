# nasihosting

Nasihosting v3.2
--------------------
![alt text](http://xcode.or.id/04_small-logo.png)

Script untuk mendukung otomatisasi akun hosting dengan apache server di Ubuntu Server

Nasihosting ini menggunakan PHP 8.0
-------------------------
Semua instalasi sudah dilakukan otomatis dalam program, tapi untuk DNS managemen tetap dari luar. (aktivasi).

File manager
------------
File manager yang digunakan adalah Tiny File Manager dengan sumber dari https://github.com/prasathmani/tinyfilemanager

Penggantian password cukup pada config.php

Untuk generate password pada sistem lama sebelum versi 1.2 :
https://tinyfilemanager.github.io/docs/pwd.html

Cara menggunakan
----------------
1. git clone https://github.com/kurniawandata/nasihosting
2. cd nasihosting
3. chmod -R 777 *
4. ./nasihosting.sh (Mendukung https tapi harus sudah mempunyai sertifikat SSL, mendukung Ubuntu Server 16.04 dan Ubuntu 18.04)

   ./nasihosting-httponly.sh (Hanya mendukung http, mendukung Ubuntu Server 16.04 dan Ubuntu 18.04) 
   
   ./nasihosting-ubuntu20.04.sh (Mendukung https tapi harus sudah mempunyai sertifikat SSL, mendukung Ubuntu Server 20.04)
   
   ./nasihosting-httponly-ubuntu20.04.sh (Hanya mendukung http, mendukung Ubuntu Server 20.04) 
   
5. Jalankan perintah 1,2,3 dan 15 lalu masuk ke fastmode atau install nasihosting-extensionpack jika ingin otomatis menambah pengguna hosting dari website dan storage-nya share.

   ./fastmode.sh (Mendukung https tapi harus sudah mempunyai sertifikat SSL, mendukung Ubuntu Server 16.04 dan Ubuntu 18.04, bisa custom nama user mysql dan database)

   ./fastmode-httponly.sh (Hanya mendukung http, mendukung Ubuntu Server 16.04 dan Ubuntu 18.04, bisa custom nama user mysql dan database)

   ./fastmode2.sh (Mendukung https tapi harus sudah mempunyai sertifikat SSL, nama user dan database sama)

   ./fastmode2-httponly.sh (Hanya mendukung http, mendukung Ubuntu Server 16.04 dan Ubuntu 18.04, nama user dan database sama)

   Jika ada tambahan ubuntu20.04 pada nama file maka support untuk ubuntu 20.04

Ganti domain utama
------------
   ./gantidomain.sh (Mendukung https)
   
   ./gantidomain-httponly.sh (Hanya mendukung http)

Kompatibilitas
--------------
Nasihosting-extensionpack tidak mendukung MySQL Server dari Ubuntu Server 20.04 sehingga pilihan distro linux terbaik untuk nasihosting adalah Ubuntu Server 18.04.5 atau Ubuntu Server 16.04.7, karena support nasihosting-extensionpack.

Keterangan untuk non fastmode
----------
Non fastmode yaitu mode di mana semuanya semi manual hingga manual, ditujukan untuk mengganti jumlah storage untuk user dan ingin mengganti alamat subdomain dengan domain.
1. Di script ini default-nya membuat file ekstensi img 150 MB jika ingin mengubah, bisa edit scriptnya
2. Jika pakai domain, bukan subdomain maka di virtualhost ganti alamatnya dengan domain baru dengan melakukan find dan replace all dengan domain yang akan dibuat (Jika di linux pakai nano bisa menggunakan ctrl + backslash)

Aktivasi https
--------------
Pastikan mempunyai sertifikat SSL, jika sudah punya, jalankan perintah ./aktifkanhttps.sh lalu enter

Script ini telah diimplementasi
-------------------------------
Anda bisa mengakses nasihosting di https://nasihosting.com

Licensi
-------
GNU General Public License v3

Program ini dibuat oleh :
--------------------------------------------
Kurniawan. E-mail : kurniawan@securityhub.id
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
