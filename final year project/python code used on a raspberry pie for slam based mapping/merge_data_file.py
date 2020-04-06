import time
import VL53L0X
import xlwt
import csv
import xlwt
import matplotlib.pyplot as plt
from array import array
from mpl_toolkits.mplot3d import Axes3D
from decimal import Decimal ## added monday
import sys
import math
arr_0 = [0]

with open('workbook_new.csv', 'rb') as csvfile:
    print("opened data file")
    data = csv.reader(csvfile, delimiter=',')
    for row in data:
        #print row #prints them in a list
        for cell in row: ##print the individual items
            arr_0.append(cell) ##coppys the entire contence of the csv file workbook_new into the array arr_0


print(arr_0)
print("-----------------------------------")
with open('testghggfdg.csv', 'rb') as csvfile:
    print("opened data file")
    data = csv.reader(csvfile, delimiter=',')
    for row in data:
        #print row #prints them in a list
        for cell in row: ##print the individual items
            arr_0.append(cell)##coppys the entire contence of the csv file testghggfdg into the array arr_0

print(arr_0)
print("-----------------------------------")
## at this point the two files are merged into one array however the data is only held on a tempary basis so the next section will save the data to the 
##new merged workbook witch will hapen below

wb = xlwt.Workbook()
ws = wb.add_sheet("sheet")
for x in range(0, 200):
    ws.write(x, 1, arr_0[x])
    ws.write(x, 2, arr_0[x*1])
    ws.write(x, 3, arr_0[x*2])
    ws.write(x, 4, arr_0[x*3])
    ws.write(x, 5, arr_0[x+4])
    ws.write(x, 6, arr_0[x*5])
    ws.write(x, 7, arr_0[x*6])
    ws.write(x, 8, arr_0[x*7])
    ws.write(x, 9, arr_0[x*8])



wb.save("nex_file_for_makeing.xls")
