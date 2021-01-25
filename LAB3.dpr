program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  ComObj,
  ActiveX,
  ExcelXP;

var
  MsExcel,Sheet,Shape:OLEVariant;
  f1,f2,f3,f4:string;
  q,i,x:integer;
  s:double;

begin
  { TODO -oUser -cConsole Main : Insert code here }
//работа с Экселем
CoInitialize(nil);
MsExcel:= CreateOleObject('Excel.Application');
MsExcel.Workbooks.Open['C:\Users\User\Desktop\Lab3.1.xlsm'];
MsExcel.Visible:= True;
f1:=MsExcel.Range['A1'];
f2:=MsExcel.Range['A2'];
f3:=MsExcel.Range['A3'];
f4:=MsExcel.Range['A4'];

//консоль для пользователя+создание таблицы
Writeln('1)',f1,'   2)',f2,'   3)',f3,'   4)',f4);
Write('Select function:');
readln(q);
MsExcel.Range['F2']:=q;

Write('Input x:');
readln(x);
MsExcel.Range['F3']:=x;
Write('Press Enter');

MsExcel.Range['A8']:='Values table';
MsExcel.Range['A9']:='X';
MsExcel.Range['B9']:='Y';

for i:=1 to x do
begin
MsExcel.Cells[9+i,1]:=i;
MsExcel.Range['F3']:=i;
s:=MsExcel.Range['F6'];
MsExcel.Cells[9+i,2]:=s;
end;

//диаграмма
Sheet:=MsExcel.Worksheets[1];
Shape:=Sheet.Shapes.AddChart;
Shape.Chart.ChartType := xlXYScatterSmooth;
Shape.Chart.SetSourceData(Source:=Sheet.Range['B10:B150']);
Shape.Chart.SeriesCollection(1).XValues := Format('=%s!$A$10:$A$150',[Sheet.Name]);

readln;
end.

