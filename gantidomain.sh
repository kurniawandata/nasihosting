echo -n "Masukkan nama domain lama : "
read domainlama
echo -n "Masukkan nama domain baru : "
read domainbaru
sed -i "s/$domainlama/$domainbaru/g" support/subdomain.conf
service apache2 restart
