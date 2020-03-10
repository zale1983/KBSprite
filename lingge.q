UserVar hwnd=111 "background windows handle"
Dim tf1,tf2,tf3,tf4,tf5,tf6,tf7,tf8,tf9,tf10
tf1=DateAdd('s',-mf1,Now)
tf2=DateAdd('s',-mf2,Now)
tf3=DateAdd('s',-mf3,Now)
tf4=DateAdd('s',-mf4,Now)
tf5=DateAdd('s',-mf5,Now)
tf6=DateAdd('s',-mf6,Now)
tf7=DateAdd('s',-mf7,Now)
tf8=DateAdd('s',-mf8,Now)
tf9=DateAdd('s',-mf9,Now)
tf10=DateAdd('s',-mf10,Now)
Dim df1,df2,df3,df4,df5,df6,df7,df8,df9,df10,dfdebug
df1=0
df2=0
df3=0
df4=0
df5=6
df6=10
df7=0
df8=0
df9=0
df10=5
dfdebug=0
Dim mf1,mf2,mf3,mf4,mf5,mf6,mf7,mf8,mf9,mf10
mf1=0
mf2=0
mf3=0
mf4=0
mf5=217
//consider tt reset condition
mf6=1709
mf7=0
mf8=0
mf9=0
mf10=71
Dim colorarea
colorarea=Array(0,0,1024,768,"1317B")
Function FindTarget()
  XY = Plugin.BkgndColor.FindColor(hwnd,colorarea(0),colorarea(1),colorarea(2),colorarea(3),colorarea(4))
  Dim color,result(2)
  color=Split(XY,"|")
  X=Clng(color(0)): Y=Clng(color(1))
  result(0)=X
  result(1)=Y
  FindTarget=result
End Function
//ready wait
Delay 5000
Rem run
//f1-f3, find target / call
//key f1
If df1>0 Then
  XY=FindTarget()
  If XY(0)<0 and XY(1)<0 Then
    Plugin.Bkgnd.KeyPress(hwnd,112)
    Delay df1*1000
  End If
End If
//key f2
If df2>0 Then
  XY=FindTarget()
  If XY(0)>0 and XY(1)>0 Then
    Plugin.Bkgnd.KeyPress(hwnd,113)
    Delay df2*1000
  End If
End If
//key f3
If df3>0 Then
  XY=FindTarget()
  If XY(0)>0 and XY(1)>0 and df3>0 Then
    Plugin.Bkgnd,KeyPress(hwnd,114)
    Delay df3*1000
  End If
End If
//10 minutes counter, 600<mf4<660 prime number
//key f4
If df4>0 Then
  tf4=DateDiff('s',tf4,Now)
  If tf4 > mf4 Then
    Plugin.Bkgnd.KeyPress(hwnd,115)
    Delay df4*1000
    tf4=Now
  End If
End If
//5 minutes counter, 240<mf5<300 prime number
If df5>0 Then
  tf5=DateDiff('s',tf5,Now)
  If tf5 > mf5 Then
    Plugin.Bkgnd.KeyPress(hwnd,116)
    Delay df5*1000
    tf5=Now
  End If
End If
//30 minutes counter, 1680<mf6<1740 prime number
If df6>0 Then
  tf6=DateDiff('s',tf6,Now)
  If tf6 > mf6 Then
    Plugin.Bkgnd.KeyPress(hwnd,117)
    Delay df6*1000
    tf6=Now
  End If
End If
//undefined counter,
If df7>0 Then
  tf7=DateDiff('s',tf7,Now)
  If tf7>mf7 Then
    Plugin.Bkgnd.KeyPress(hwnd,118)
    Delay df7*1000
    tf7=Now
  End If
End If
If df8>0 Then
  tf8=DateDiff('s',tf8,Now)
  If tf8>mf8 Then
    Plugin.Bkgnd.KeyPress(hwnd,119)
    Delay df8*1000
    tf8=Now
  End If
End If
If df9>0 Then
  tf9=DateDiff('s',tf9,Now) 
  If tf9 > mf9 Then
    Plugin.Bkgnd.KeyPress(hwnd,120)
    Delay df9*1000
    tf9=Now
  End If
End If
//pickup counter, 60<mf10<120,
If df10>0 Then
  tf10=DateDiff('s',tf10,Now)
  If tf10 > mf10 Then
    Plugin.Bkgnd.KeyPress(hwnd,118)
    Delay df7*1000
    tf10=Now
  End If
End If
If dfdebug>0 Then
  Delay dfdebug*1000
End If
Goto run
