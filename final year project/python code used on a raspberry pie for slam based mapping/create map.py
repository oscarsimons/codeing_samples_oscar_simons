import time
import VL53L0X
import xlwt
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
import numpy as np
from array import array
import sys
import os
import math
import RPi.GPIO as GPIO
#!/usr/bin/python
from LIS3DH import LIS3DH
from time import sleep
def clickcallback(channel):
    # interrupt handler callback
    print("Interrupt detected")
    click = sensor.getClick()
    print("Click detected (0x%2X)" % (click))
    if (click & 0x10):
        print(" single click")
    if (click & 0x20):
        print(" double click")
sensor = LIS3DH(debug=True)
sensor.setRange(LIS3DH.RANGE_2G)
sensor.setClick(LIS3DH.CLK_DOUBLE, 200, mycallback=clickcallback)
x = sensor.getX()
y = sensor.getY()
z = sensor.getZ()
print("\rX: %.6f\tY: %.6f\tZ: %.6f" % (x, y, z))##prints the raw accselorometer data to the screen
        
n1 = sys.argv[1] #n1 = this is the name of the file to save the data into 
n2 = sys.argv[2]##servo one pin 9 refers to the control pin of the servo 1
n3 = sys.argv[3]#servo 2 pin 10r efers to the control pin of the servo 2
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
servoPin_one=int(n2)#will be for rotating round
servoPin_two=int(n3)##will be for rotating the angl

GPIO.setup(servoPin_one, GPIO.OUT)
pwm_one=GPIO.PWM(servoPin_one,50)
pwm_one.start(7.5)
GPIO.setup(servoPin_two, GPIO.OUT)
pwm_two=GPIO.PWM(servoPin_two,50)
pwm_two.start(7.5)

samples_taken = 100##this refers to the number of samples this takes from all the sensors

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
c='b'
mark='o'
old_val=0
old_val2=0
servo_1=0
servo_2=0
##20 round
Position_array_servo_one = ["40", "43", "46", "49", "52", "55", "58", "61", "64", "67"]
##left right 12
Position_array_servo_two = ["0", "10", "20", "30", "40", "50", "60", "70", "80", "90"]
##  two ok for test purpose still not great
old_b = 0

arr_0 = [samples_taken+1]#the reason why i have to add 1 to the array sise is because the array starts at 1 so the actual sise of the array is 99
arr_1 = [samples_taken+1]## 0 to 6 arrays refers to the 7 sensor readings
arr_2 = [samples_taken+1]
arr_3 = [samples_taken+1]
arr_4 = [samples_taken+1]
arr_5 = [samples_taken+1]
arr_6 = [samples_taken+1]


##sets up the sensors 0 to 7 by createing the object instance
tof1 = VL53L0X.VL53L0X(TCA9548A_Num=1, TCA9548A_Addr=0x70)
tof2 = VL53L0X.VL53L0X(TCA9548A_Num=2, TCA9548A_Addr=0x70)
tof0 = VL53L0X.VL53L0X(TCA9548A_Num=0, TCA9548A_Addr=0x70)
tof3 = VL53L0X.VL53L0X(TCA9548A_Num=3, TCA9548A_Addr=0x70)
tof4 = VL53L0X.VL53L0X(TCA9548A_Num=4, TCA9548A_Addr=0x70)
tof5 = VL53L0X.VL53L0X(TCA9548A_Num=5, TCA9548A_Addr=0x70)
tof6 = VL53L0X.VL53L0X(TCA9548A_Num=6, TCA9548A_Addr=0x70)

tof1.start_ranging(VL53L0X.VL53L0X_BETTER_ACCURACY_MODE)## starts the sensors to run to make sure they are conected to the device
tof2.start_ranging(VL53L0X.VL53L0X_BETTER_ACCURACY_MODE)
tof0.start_ranging(VL53L0X.VL53L0X_BETTER_ACCURACY_MODE)
tof3.start_ranging(VL53L0X.VL53L0X_BETTER_ACCURACY_MODE)
tof4.start_ranging(VL53L0X.VL53L0X_BETTER_ACCURACY_MODE)
tof5.start_ranging(VL53L0X.VL53L0X_BETTER_ACCURACY_MODE)
tof6.start_ranging(VL53L0X.VL53L0X_BETTER_ACCURACY_MODE)
wb = xlwt.Workbook()
ws = wb.add_sheet("sheet")

DC=0.061*(40*10)+2#moves the servo that controls the pitch to a central postion
pwm_one.ChangeDutyCycle(DC)
time.sleep(1)

timing = tof1.get_timing()
print("---------------")
if (timing < 20000):
    timing = 20000
print ("Timing %d ms" % (timing/1000))
print ("starting data collection")

for count in range(1, samples_taken):
    print(count)
    distance1 = tof1.get_distance()## reads in the sensor value
    if (distance1 > 0):
        arr_0.insert(count, distance1)
        if (distance1 < 10):
            print("Error Error colition warning about to impact")
    distance2 = tof2.get_distance()## reads in the sensor value
    if (distance2 > 0):
        arr_1.insert(count, distance2)
        if (distance1 < 10):
            print("Error Error colition warning about to impact")
    distance3 = tof0.get_distance()## reads in the sensor value
    if (distance3 > 0):
        arr_2.insert(count, distance3)
        if (distance1 < 10):
            print("Error Error colition warning about to impact")
    distance4 = tof3.get_distance()## reads in the sensor value
    if (distance4 > 0):
        arr_3.insert(count, distance4)
        if (distance1 < 10):
            print("Error Error colition warning about to impact")
    distance5 = tof4.get_distance()## reads in the sensor value
    if (distance5 > 10):
        arr_4.insert(count, distance5)
        if (distance1 < 10):
            print("Error Error colition warning about to impact")
    distance6 = tof5.get_distance()## reads in the sensor value
    if (distance6 > 0):
        arr_5.insert(count, distance6)
        if (distance1 < 10):
            print("Error Error colition warning about to impact")
    distance7 = tof6.get_distance()## reads in the sensor value
    if (distance7 > 0):
        arr_6.insert(count, distance7)
        if (distance1 < 10):
            print("Error Error colition warning about to impact")

    print(distance1)##prints the values to the screen
    print(distance2)
    print(distance3)
    print(distance4)
    print(distance5)
    print(distance6)
    print(distance7)
    
    ab_ang_arr, c_ang_arr = divmod(count, 10) ## calculates the array value for angle
    a_ang_arr, b_ang_arr = divmod(ab_ang_arr, 10)

    
    #plots th graph where ax is the axis where the 3d graph is plot
    #distances 1,2,3,7 are for the horizontall placements
    ##distance 4, 5 are the vertical placements
    ##distsance 6 will be attached to the camera
    ##ax.scatter is in form x y z
    ##the let table
    x = sensor.getX()##gets the data from the accselorometer and saves it into the varables x, y, z
    y = sensor.getY()
    z = sensor.getZ()
    print("\rX: %.6f\tY: %.6f\tZ: %.6f" % (x, y, z))
       
    ws.write(count, 1, distance1)## writes TOf 1 sensor reading into colum 1 of the worksheet
    ws.write(count, 2, distance2)## writes TOf 2 sensor reading into colum 2 of the worksheet
    ws.write(count, 3, distance3)## writes TOf 3 sensor reading into colum 3 of the worksheet
    ws.write(count, 4, distance4)## writes TOf 4 sensor reading into colum 4 of the worksheet
    ws.write(count, 5, distance5)## writes TOf 5 sensor reading into colum 5 of the worksheet
    ws.write(count, 6, distance6)## writes TOf 6 sensor reading into colum 6 of the worksheet
    ws.write(count, 7, distance7)## writes TOf 7 sensor reading into colum 7 of the worksheet
    ws.write(count, 8, str(Position_array_servo_two[c_ang_arr])) ## writes the servo 1 position into colum 8 of the worksheet
    ws.write(count, 9, str(Position_array_servo_one[b_ang_arr]))## writes the servo 2 position into colum 9 of the worksheet
    ws.write(count, 10, x)## writes the x acselorometer reading into the worksheet
    ws.write(count, 11, y)## writes the y acselorometer reading into the worksheet
    ws.write(count, 12, z)## writes the z acselorometer reading into the worksheet
    
    print("-----------count---------------------------------")
    print(count)  
    
    DC=0.061*(c_ang_arr*10)+2##creates the duty cycle (the duty cycle refers to the position of the servo 
    pwm_two.ChangeDutyCycle(DC)## convers degres to the correct duty cycle
    time.sleep(1)
        #servo_2+25
    if(old_b != b_ang_arr):
        DC=0.061*(b_ang_arr*10)+2
        pwm_one.ChangeDutyCycle(DC)
        time.sleep(1)
        ##
    time.sleep(0.2)
    
#end of controlling the servos      Position_array_servo_one 
tof0.stop_ranging()##stops the sampleing of the tof sensors
tof1.stop_ranging()
tof2.stop_ranging()
tof3.stop_ranging()
tof4.stop_ranging()
tof5.stop_ranging()
tof6.stop_ranging()

ax.set_xlabel('X Label')##lables the axis of the map
ax.set_ylabel('Y Label')
ax.set_zlabel('Z Label')

plt.show() ##shows the graph
    
wb.save(n1 + ".xls")##saves the datafile


