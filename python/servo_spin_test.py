import RPi.GPIO as GPIO
import time

servo_pin = 17
GPIO.setmode(GPIO.BCM)
GPIO.setup(servo_pin, GPIO.OUT)

p = GPIO.PWM(servo_pin, 50) # GPIO 17 for PWM with 50Hz
p.start(0) # Initialization

def setDirection(direction):
    duty = 10 / 180 * direction + 2.5
    p.ChangeDutyCycle(duty)
    print("direction =", direction, "-> duty =", duty)
    time.sleep(0.5)

try:
    for direction in range(0, 181, 10):
        setDirection(direction)
except KeyboardInterrupt:
    p.stop()
    GPIO.cleanup()