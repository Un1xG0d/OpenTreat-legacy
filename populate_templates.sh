cd ~/OpenTreat/src/

read -p "[prompt] Heroku app name: " heroku_app
read -p "[prompt] Create webapp password: " webapp_pass
read -p "[prompt] Raspberry Pi's public IP address: " pub_ip
read -p "[prompt] TURN server URL: " turn_url
read -p "[prompt] TURN server username: " turn_username
read -p "[prompt] TURN server password: " turn_password

#Handle replacements in broadcast_webcam.py
sed -e "s#<my-opentreat-project>#$heroku_app#g" -e "s#<view-page-password>#$webapp_pass#g" templates/broadcast_webcam.py > python/broadcast_webcam.py
echo -e "[info] File generated: python/broadcast_webcam.py\n[info] Changes:"
cat python/broadcast_webcam.py |grep $heroku_app
cat python/broadcast_webcam.py |grep $webapp_pass

#Handle replacements in watch.js
sed -e "s#<turn-url>#$turn_url#g" -e "s#<turn-username>#$turn_username#g" -e "s#<turn-password>#$turn_password#g" -e "s#<rpi-ip-address>#$pub_ip#g" templates/watch.js > js/public/watch.js
echo -e "[info] File generated: js/public/watch.js\n[info] Changes:"
cat js/public/watch.js |grep $pub_ip
cat js/public/watch.js |grep $turn_url
cat js/public/watch.js |grep $turn_username
cat js/public/watch.js |grep $turn_password

#Replace <view-page-password> with $webapp_pass
sed -e "s#<view-page-password>#$webapp_pass#g" templates/users.js > js/db/users.js
echo -e "[info] File generated: js/db/users.js\n[info] Changes:"
cat js/db/users.js |grep $webapp_pass