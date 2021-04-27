import RPi.GPIO as GPIO
import time

servo_pin = 17
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
GPIO.setup(servo_pin, GPIO.OUT)

p = GPIO.PWM(servo_pin, 50) # GPIO 17 for PWM with 50Hz
p.start(0)

try:
    p.ChangeDutyCycle(5)
    time.sleep(1)
    p.ChangeDutyCycle(12.5)
    time.sleep(0.5)
    p.stop()
except KeyboardInterrupt:
    p.stop()
    GPIO.cleanup()