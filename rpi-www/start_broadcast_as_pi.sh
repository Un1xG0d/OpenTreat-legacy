source /var/www/secrets/pipw
echo $PI_PW |sudo pkill -f chrom*
echo $PI_PW |su - pi -c "python3 /var/www/html/broadcast_webcam.py"