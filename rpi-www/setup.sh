#Usage: sudo setup.sh

apt update
apt install apache2 php7.3 libapache2-mod-php7.3
pip3 install -r ~/OpenTreat/src/python/requirements.txt
rm -rf /var/www/html/index.html
touch /var/www/html/index.html
cp ~/OpenTreat/src/rpi-www/rotate_auger.py /var/www/html/
cp ~/OpenTreat/src/rpi-www/spin.php /var/www/html/
cp ~/OpenTreat/src/rpi-www/restart.php /var/www/html/
cp ~/OpenTreat/src/rpi-www/start_broadcast.php /var/www/html/
cp ~/OpenTreat/src/rpi-www/start_broadcast_as_pi.sh /var/www/html/
cp ~/OpenTreat/src/python/broadcast_webcam.py /var/www/html/
adduser www-data gpio
chown root.gpio /dev/mem
chmod g+rw /dev/mem