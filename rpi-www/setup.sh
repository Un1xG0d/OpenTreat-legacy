#Usage: sudo setup.sh

apt update
apt install apache2 php7.3 libapache2-mod-php7.3
pip3 install -r ~/OpenTreat/src/python/requirements.txt
cp rotate_auger.py /var/www/html/
cp spin.php /var/www/html/
adduser www-data gpio
chown root.gpio /dev/mem
chmod g+rw /dev/mem