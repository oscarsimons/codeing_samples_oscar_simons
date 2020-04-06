import time
import VL53L0X
import xlwt
import numpy as np
from array import array
import sys
import os
import math
import time
import csv
from array import array
from decimal import Decimal 
arr_0 = []
arr_1 = []
arr_2 = []
arr_3 = []
arr_4 = []
arr_5 = []
arr_6 = []
arr_7 = []
arr_8 = []
arr_9 = []
k=0
tof0 = VL53L0X.VL53L0X(TCA9548A_Num=0, TCA9548A_Addr=0x70)
tof1 = VL53L0X.VL53L0X(TCA9548A_Num=1, TCA9548A_Addr=0x70)
tof2 = VL53L0X.VL53L0X(TCA9548A_Num=2, TCA9548A_Addr=0x70)
tof3 = VL53L0X.VL53L0X(TCA9548A_Num=3, TCA9548A_Addr=0x70)
tof4 = VL53L0X.VL53L0X(TCA9548A_Num=4, TCA9548A_Addr=0x70)
tof5 = VL53L0X.VL53L0X(TCA9548A_Num=5, TCA9548A_Addr=0x70)
tof6 = VL53L0X.VL53L0X(TCA9548A_Num=6, TCA9548A_Addr=0x70)

tof1.start_ranging(VL53L0X.VL53L0X_BETTER_ACCURACY_MODE)
tof2.start_ranging(VL53L0X.VL53L0X_BETTER_ACCURACY_MODE)
tof0.start_ranging(VL53L0X.VL53L0X_BETTER_ACCURACY_MODE)
tof3.start_ranging(VL53L0X.VL53L0X_BETTER_ACCURACY_MODE)
tof4.start_ranging(VL53L0X.VL53L0X_BETTER_ACCURACY_MODE)
tof5.start_ranging(VL53L0X.VL53L0X_BETTER_ACCURACY_MODE)
tof6.start_ranging(VL53L0X.VL53L0X_BETTER_ACCURACY_MODE)


timing = tof1.get_timing()
print("---------------")
if (timing < 20000):
    timing = 20000
print ("Timing %d ms" % (timing/1000))
print ("starting data collection")

distance1 = tof1.get_distance()
distance2 = tof2.get_distance()
distance3 = tof0.get_distance()
distance4 = tof3.get_distance()
distance5 = tof4.get_distance()
distance6 = tof5.get_distance()
distance7 = tof6.get_distance()
print(distance1)
print(distance2)
print(distance3)
print(distance4)
print(distance5)
print(distance6)
print(distance7)
       
tof0.stop_ranging()
tof1.stop_ranging()
tof2.stop_ranging()
tof3.stop_ranging()
tof4.stop_ranging()
tof5.stop_ranging()
tof6.stop_ranging()




#will only open csv files
with open('test_sun_8.csv', 'rb') as csvfile:
    print("opened data file")
    data = csv.reader(csvfile, delimiter=',')
    for row in data:
        #print row #prints them in a list
        for cell in row: ##print the individual items
            arr_0.append(cell)
            k=k+1
print("the following number represents the number of datapoints in the map")
print("each datapoint contains 7 time of flight sensor readings adn 2 srvo valus")
print(k)
i=0
l=0
for x in range(0, k, 9):
    if(int(arr_0[x])==int(distance1) and (int(distance1)>0)):
        arr_1.append(arr_0[x])## dist 0
        l=l+1
        print("position" + str(x) + " matches for Time of Flight sensor A")
    if(int(arr_0[x+1])==int(distance2) and (distance2>0)):
        arr_2.append(arr_0[x+1])##dist 1
        l=l+1
        print("position" + str(x) + " matches for Time of Flight sensor B")
    if(int(arr_0[x+2])==int(distance3) and (int(distance3>0))):
        arr_3.append(arr_0[x+2])##dist 2
        l=l+1
        print("position" + str(x) + " matches for Time of Flight sensor C")
    if(int(arr_0[x+3])==int(distance4) and (int(distance4)>0)):
        arr_4.append(arr_0[x+3])##dist 3
        l=l+1
        print("position" + str(x) + " matches for Time of Flight sensor D")
    if(int(arr_0[x+4])==int(distance5) and (int(distance5)>0)):
        arr_5.append(arr_0[x+4])##dist 4
        l=l+1
        print("position" + str(x) + " matches for Time of Flight sensor E")
    if(int(arr_0[x+5])==int(distance6) and (int(distance6)>0)):
        arr_6.append(arr_0[x+5])## dist 5
        l=l+1
        print("position" + str(x) + " matches for Time of Flight sensor F")
    if(int(arr_0[x+6])==int(distance7) and (int(distance7)>0)):
        arr_7.append(arr_0[x+6])##dist 6
        l=l+1
        print("position" + str(x) + " matches for Time of Flight sensor G")
    i=i+1
    if (i==9):
        i=0
i=0
if(l==7):
    print("exact match the sensors are reading the same position as a prebuilt map")
l=0
print("opened data values")
print("plotted data")
print("-arr 1--")
print(arr_1)
print("---arr 2------")
print(arr_2)
print("---arr 3--------")
print(arr_3)
print("-arr 4-----")
print(arr_4)
print("--arr 5----")
print(arr_5)
print("--arr 6-------")  
print(arr_6)
print("---------arr 7-------")
print(arr_7)
print("--arr 8-------")  
print(arr_8)
print("--arr 9-------")  
print(arr_9)
