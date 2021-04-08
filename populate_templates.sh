cd ~/OpenTreat/src/

read -p "[prompt] Heroku app name: " heroku_app #enter only app name, not full url
read -p "[prompt] Create webapp password: " webapp_pass #choose login password for js webapp
read -p "[prompt] Create tunnel subdomain name: " ngrok_sub #choose ngrok subdomain name
#read -p "[prompt] Create tunnel password: " ngrok_pass #used for Basic auth to ngrok
read -p "[prompt] TURN server URL: " turn_url #created on numb.viagenie.ca and sent via email
read -p "[prompt] TURN server username: " turn_username #created on numb.viagenie.ca and sent via email
read -p "[prompt] TURN server password: " turn_password #created on numb.viagenie.ca and sent via email

#Handle replacements in broadcast_webcam.py
sed -e "s#<my-opentreat-project>#$heroku_app#g" -e "s#<view-page-password>#$webapp_pass#g" templates/broadcast_webcam.py > python/broadcast_webcam.py
echo -e "[info] File generated: python/broadcast_webcam.py\n[info] Changes:"
cat python/broadcast_webcam.py |grep $heroku_app
cat python/broadcast_webcam.py |grep $webapp_pass

#Handle replacements in watch.js
sed -e "s#<turn-url>#$turn_url#g" -e "s#<turn-username>#$turn_username#g" -e "s#<turn-password>#$turn_password#g" templates/watch.js > js/securescript/watch.js
echo -e "[info] File generated: js/securescript/watch.js\n[info] Changes:"
cat js/securescript/watch.js |grep $turn_url
cat js/securescript/watch.js |grep $turn_username
cat js/securescript/watch.js |grep $turn_password

#Handle replacements in broadcast.js
sed -e "s#<turn-url>#$turn_url#g" -e "s#<turn-username>#$turn_username#g" -e "s#<turn-password>#$turn_password#g" templates/broadcast.js > js/securescript/broadcast.js
echo -e "[info] File generated: js/securescript/broadcast.js\n[info] Changes:"
cat js/securescript/broadcast.js |grep $turn_url
cat js/securescript/broadcast.js |grep $turn_username
cat js/securescript/broadcast.js |grep $turn_password

#Replace <view-page-password> with $webapp_pass
sed -e "s#<view-page-password>#$webapp_pass#g" templates/users.js > js/db/users.js
echo -e "[info] File generated: js/db/users.js\n[info] Changes:"
cat js/db/users.js |grep $webapp_pass

#Handle replacements in ot_ngrok.sh
sed -e "s#<ngrok-sub>#$ngrok_sub#g" templates/ot_ngrok.sh > rpi-www/ot_ngrok.sh
echo -e "[info] File generated: rpi-www/ot_ngrok.sh\n[info] Changes:"
cat rpi-www/ot_ngrok.sh |grep $ngrok_sub

#Print main URL to bookmark
echo -e "[.   ]\n[..  ]\n[... ]\n[....]\n[info] Your OpenTreat instance link is: https://$heroku_app.herokuapp.com\n[done] Please bookmark the above URL on your phone and laptop!"