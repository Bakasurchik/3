#чтобы подключить модуль-через командную строку: pip install pypiwin32
import win32com.client
import os
import sys

excel_filename = 'Lab3.1.xlsm'
application_path = os.path.dirname(__file__)
excel_path = os.path.join(application_path, excel_filename)

#Создаем COM объект
Excel = win32com.client.Dispatch("Excel.Application")

#Получаем доступ к активному листу
wb = Excel.Workbooks.Open(excel_path)
Excel.Visible = True
sheet = wb.ActiveSheet

#Вывод названий функций
for i in range(1, 5):
    f = sheet.Cells(i,1).value
    print(f)

answ = int(input('Выберите функцию: '))
sheet.Cells(2,6).value = answ

#Построение таблицы значений
x=int(input('x= '))

sheet.Cells(8,1).value = 'Таблица значений'
sheet.Cells(9,1).value = 'X'
sheet.Cells(9,2).value = 'Y'

i=1
for i in range(x):
    i+=1
    sheet.Cells(10+i, 1).value = i
    sheet.Cells(3, 6).value= i
    y = sheet.Cells(6, 6).value
    sheet.Cells(10+i, 2).value = y

#построение графика
chart = Excel.Charts.Add()
chart.Name= "Диаграмма"
chart.ActiveChart.Type = win32com.client.constants.xlXYScatterSmooth
series = chart.SeriesCollection(1)
series.XValues= sheet.Range("A11:A"+ str(100))
series.Values= sheet.Range("B11:B"+ str(100))


    
    
    
