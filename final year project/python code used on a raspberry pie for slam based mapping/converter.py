##The following program enables me to convert a xlsx file witch i can save data in to a csv file witch is how i can open and use the data to create the map
##please pay atention to the system arguments n1 and n2 this refers to the workbook you want to open (n1)
##n2 refers to the file to save the csv file into

import xlrd
import csv
import sys
n1 = sys.argv[1]
n2 = sys.argv[2]
def csv_from_excel():
    wb = xlrd.open_workbook(n1 + ".xlsx")
    sh = wb.sheet_by_name('Sheet1')
    your_csv_file = open(n2 + ".csv", 'w')
    wr = csv.writer(your_csv_file, quoting=csv.QUOTE_ALL)
    for rownum in range(sh.nrows):
        wr.writerow(sh.row_values(rownum))
    your_csv_file.close()

# runs the csv_from_excel function:
csv_from_excel()

