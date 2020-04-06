#
#
#
#
import time
#import VL53L0X
import xlwt
import csv
import xlwt
import matplotlib.pyplot as plt## this is used for ploting data in a graph
from array import array
from mpl_toolkits.mplot3d import Axes3D
from decimal import Decimal ## added monday
import sys
import math
x_values = []
y_values = []
z_values = []
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
arr_10 = []
arr_11 = []
arr_12 = []
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d') ##ax is the 3d scatter graph used to plot the data to the screen

angles_one = [40, 43, 46, 49, 52, 55, 58, 61, 64, 67, 70, 73]
angles_two = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 0, 10, 20, 30, 40]
k=0
#will only open csv files
with open('test_sun_8.csv', 'rb') as csvfile:
    print("opened data file")
    data = csv.reader(csvfile, delimiter=',')
    for row in data:
        #print row #prints them in a list
        for cell in row: ##print the individual items
            arr_0.append(cell)
            k=k+1## the k varable is used to know how mutch data is in the csv file to be used latter
c='b'
m='o'
i=0
x=0
y=0
print("the following number represents the number of datapoints in the map")
print("each datapoint contains 7 time of flight sensor readings adn 2 srvo valus")
print(k)

for x in range(0, k, 12): ##the for loop steps in groups of 12 and will keep going to the end of the data file              
    arr_1.append(arr_0[x])## dist 0
    arr_2.append(arr_0[x+1])##dist 1
    arr_3.append(arr_0[x+2])##dist 2
    arr_4.append(arr_0[x+3])##dist 3
    arr_5.append(arr_0[x+4])##dist 4
    arr_6.append(arr_0[x+5])## dist 5
    arr_7.append(arr_0[x+6])##dist 6
    arr_9.append(int(arr_0[x+7]))##servo value 0
    arr_8.append(int(arr_0[x+8]))##servo value 1
    arr_10.append(int(arr_0[x+9]))#adds acselormeter data chanel x_values into the array
    arr_11.append(int(arr_0[x+10]))#adds acselormeter data chanel y_values into the array
    arr_12.append(int(arr_0[x+11]))#adds acselormeter data chanel z_values into the array
    i=i+1
    if (i==12):
        i=0
i=0        
print("opened data values")
print("plotted data")
print("-arr 1--")
print(arr_1)## prints sensor 1 data to the screen
print("---arr 2------")
print(arr_2)## prints sensor 2 data to the screen
print("---arr 3--------")
print(arr_3)## prints sensor 3 data to the screen
print("-arr 4-----")
print(arr_4)## prints sensor 4 data to the screen
print("--arr 5----")
print(arr_5)## prints sensor 5 data to the screen
print("--arr 6-------")  
print(arr_6)## prints sensor 6 data to the screen
print("---------arr 7-------")
print(arr_7)## prints sensor 7 data to the screen
print("--arr 8-------")  
print(arr_8)##prints servo 0 position to the screen
print("--arr 9-------")  
print(arr_9)  ## prints servo 1 position to the screen
## arrays in the format
#dist_1 dist_2 dist_3 dist_4 dist_5 dist_6 dist_7 angle_servo_2 angle_servo_1

#arr_1[1]== distance 1-- will referr to e+0
#arr_1[2]== distance 2--will refer to e+90
#arr_1[3]== distance 3--will refer to e+180
#arr_1[7]== distance 7-- will referr to e+270

#arr_1[10]== m1==e
#arr_1[11]== m2==e+theta witch refers top the sensor 90 180 270 0 ect
car='b'
mark='o'
x=float(0.0)
y=float(0.0)
z=float(0.0)
j=0;
for x in range(0, k, 9):  ##should be 98
    
    initial_x=0
    initial_y=0
    initial_z=1
    b=(initial_x^2+initial_y^2)**(1/2)## has to be done out of order because a relise on a b value
    a=math.cos(b^2+initial_x^2-initial_z)/(2*b*initial_z)
    d=(initial_y^2+initial_z^2)**(1/2)
    c=1.0
    #a, b = divmod(j, 10)
    e=int(arr_8[i])
    f=1.0
    g=1.0
    #print("angles_one[i]")
    #print(angles_one[i])
    ##-----------------------------
    ##the next section takes in the 7 data chanels and converts them into xyz coordernates for the map
    ##----------------------------
    temp =float(arr_7[i])  
    e=((angles_one[i]*10*math.pi)/180)
    m=3.5+temp## m becomes a baseline from scree to point
    temp=(float(angles_two[j]))
    h=temp+0 ## this can change due to srvo position 0, 90, 180, 270
    temp1=float(math.sin(h))
    temp2=float(math.sin(e))
    temp3=float(math.cos(h))
    temp4=float(math.cos(e))
    x_1=(g*temp1+35*temp2+3.5)*5
    #print(x)
    x_values.append(x_1)
    y=(g*temp3+35*temp4)*5
    y_values.append(y)
    #print(y)
    z=(g*temp3*temp2+35*temp2)*20
    z_values.append(z)
    #print(z)
    ax.scatter(x_1, y, z, c=car, marker=mark)


######################
    temp =float(arr_6[i])
    m=3.5+temp## m becomes a baseline from scree to point
    temp=(float(angles_two[j]))
    e=((float(10*angles_one[i])*math.pi)/180)
    h=temp+90 ## this can change due to srvo position 0, 90, 180, 270
    temp1=float(math.sin(h))
    temp2=float(math.sin(e))
    temp3=float(math.cos(h))
    temp4=float(math.cos(e))
    x_1=(g*temp1+35*temp2+35)*5
    #print(x)
    x_values.append(x_1)
    y=(g*temp3+35*temp4)*5
    #print(y)
    y_values.append(y)
    z=(g*temp3*temp2+35*temp2)*20
    #print(z)
    z_values.append(z)
    ax.scatter(x_1, y, z, c=car, marker=mark)
#####################
######################
    temp =float(arr_5[i])
    m=3.5+temp## m becomes a baseline from scree to point
    temp=(float(angles_two[j]))
    e=((float(angles_one[i])*math.pi)/180)       
    h=temp+180 ## this can change due to srvo position 0, 90, 180, 270
    temp1=float(math.sin(h))
    temp2=float(math.sin(e))
    temp3=float(math.cos(h))
    temp4=float(math.cos(e))
    x_1=(g*temp1+35*temp2+35)*5
    #print(x)
    x_values.append(x_1)
    y=(g*temp3+35*temp4)*5
    #print(y)
    y_values.append(y)
    z=(g*temp3*temp2+35*temp2)*20
    #print(z)
    z_values.append(z)
    ax.scatter(x_1, y, z, c=car, marker=mark)
#####################
######################
    temp =float(arr_3[i])##distance
    m=3.5+temp## m becomes a baseline from scree to point
    temp=(float(angles_two[j]))
    e=((float(angles_one[i])*math.pi)/180)+90
    h=temp+270 ## this can change due to srvo position 0, 90, 180, 270
    temp1=float(math.sin(h))            
    temp2=float(math.sin(e))
    temp3=float(math.cos(h))
    temp4=float(math.cos(e))
    x_1=(g*temp1+35*temp2+35)*5
    #print(x)
    x_values.append(x_1)
    y=(g*temp3+35*temp4)*5
    #print(y)
    y_values.append(y)
    z=(g*temp3*temp2+35*temp2)*20
    #print(z)
    z_values.append(z)
    ax.scatter(x_1, y, z, c=car, marker=mark)
#####################
    temp =float(arr_0[i])##distance
    m=3.5+temp## m becomes a baseline from scree to point
    temp=(float(angles_two[j])+90)
    e=((float(angles_one[i])*math.pi)/180)+90
    h=temp+0 ## this can change due to srvo position 0, 90, 180, 270
    temp1=float(math.sin(h))## the 4 temp values enables the code to cut down the processing time of the exations by oinly calculateing it once
    temp2=float(math.sin(e))   
    temp3=float(math.cos(h))
    temp4=float(math.cos(e))
    x_1=(g*temp1+35*temp2+35)*5
    #print(x)
    x_values.append(x_1)
    y=(g*temp3+35*temp4)*5## calculates the y position
    #print(y)
    y_values.append(y)
    z=(g*temp3*temp2+35*temp2)*20
    #print(z)
    z_values.append(z)
    ax.scatter(x_1, y, z, c=car, marker=mark)
    temp =float(arr_1[i])##distance
    m=3.5+temp## m becomes a baseline from scree to point
    temp=(float(angles_two[j])+90)
    e=((float(angles_one[i])*math.pi)/180)+90
    h=temp+0 ## this can change due to srvo position 0, 90, 180, 270
    temp1=float(math.sin(h))
    temp2=float(math.sin(e))
    temp3=float(math.cos(h))
    temp4=float(math.cos(e))
    x_1=(g*temp1+35*temp2+35)*5
    #print(x)
    x_values.append(x_1)
    y=(g*temp3+35*temp4)*5
    #print(y)
    y_values.append(y)
    z=(g*temp3*temp2+35*temp2)*20
    #print(z)
    z_values.append(z)
    ax.scatter(x_1, y, z, c=car, marker=mark)
    if (i==9):
        i=0
        j=j+1
    if (i<9):
        i=i+1
    if(x>99):
        j=0
#####################
print("BREAK")
print("BREAK")
print("BREAK")
print("xvalues")
print(x_values)
print("yvalues")
print(y_values)
print("zvalues")
print(z_values)   
ax.set_xlabel('X Label')
ax.set_ylabel('Y Label')
ax.set_zlabel('Z Label')

plt.show()

print("plot now active")
