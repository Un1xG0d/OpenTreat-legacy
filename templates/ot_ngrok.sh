source /var/www/secrets/pipw
#echo $PI_PW |su - pi -c "sudo pkill -f *ngrok"
echo $PI_PW |su - pi -c '/home/pi/ngrok http -subdomain=<ngrok-sub> -auth='"pi:$NGROK_PW"' 80 &'