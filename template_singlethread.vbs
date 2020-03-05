UserVar hwnd=111 "background windows handle"
Dim tt
tt=0
Dim Df1,Df2,Df3,Df4,Df5,Df6,Df7,Df8,Df9,Df10,Dfdebug
Df1=1
Df2=1
Df3=4
Df4=0
Df5=0
Df6=0
Df7=0
Df8=0
Df9=0
Df10=5
Dfdebug=0
Dim Mf1,Mf2,Mf3,Mf4,Mf5,Mf6,Mf7,Mf8,Mf9,Mf10
Mf1=0
Mf2=0
Mf3=0
Mf4=617
Mf5=217
Mf6=0
Mf7=0
Mf8=0
Mf9=0
Mf10=71
Function FindTarget()
  XY = Plugin.BkgndColor.FindColor(hwnd,colorarea(0),colorarea(1),colorarea(2),colorarea(3),colorarea(4))
  Dim color,result(2)
  color=Split(XY,"|")
  X=Clng(color(0)): Y=Clng(color(1))
  result(0)=X
  result(2)=Y
  FindTarget=result
End Function
Rem run
//f1-f3, find target / call
//key f1
XY=FindTarget()
If XY(0)<0 and XY(1)<0 and Df1>0 Then
  Plugin.Bkgnd.KeyPress(hwnd,112)
  Delay Df1*1000
  tt=tt+Df1
End If
//key f2
XY=FindTarget()
If XY(0)>0 and XY(1)>0 and Df2>0 Then
  Plugin.Bkgnd.KeyPress(hwnd,113)
  Delay Df2*1000
  tt=tt+Df2
End If
//key f3
XY=FindTarget()
If XY(0)>0 and XY(1)>0 and Df3>0 Then
  Plugin.Bkgnd,KeyPress(hwnd,114)
  Delay Df3*1000
  tt=tt+Df3
End If
//10 minutes counter, 600<Mf4<660 prime number
//key f4
If Mf4>0 and Df4>0 and (tt Mod Mf4)=0 Then
  Plugin.Bkgnd.KeyPress(hwnd,115)
  Delay Df4*1000
  tt=tt+Df4
End If
//5 minutes counter, 240<Mf5<300 prime number
If Mf5>0 and Df5>0 and (tt Mod Mf5)=0 Then
  Plugin.Bkgnd.KeyPress(hwnd,116)
  Delay Df5*1000
  tt=tt+Df5
End If
//30 minutes counter, 1740<Mf6<1800 prime number
If Mf6>0 and Df6>0 and (tt Mod Mf6)=0 Then
  Plugin.Bkgnd.KeyPress(hwnd,117)
  Delay Df6*1000
  tt=tt+Df6
End If
//undefined counter,
If Mf7>0 and Df7>0 and (tt Mod Mf7)=0 Then
  Plugin.Bkgnd.KeyPress(hwnd,118)
  Delay Df7*1000
  tt=tt+Df7
End If
If Mf8>0 and Df8>0 and (tt Mod Mf8)=0 Then
  Plugin.Bkgnd.KeyPress(hwnd,119)
  Delay Df8*1000
  tt=tt+Df8
End If
If Mf9>0 and Df9>0 and (tt Mod Mf9)=0 Then
  Plugin.Bkgnd.KeyPress(hwnd,120)
  Delay Df9*1000
  tt=tt+Df9
End If
//pickup counter, 60<Mf10<120,
If Mf10>0 and Df10>0 and (tt Mod Mf10)=0 Then
  Plugin.Bkgnd.KeyPress(hwnd,118)
  Delay Df7*1000
  tt=tt+Df7
End If
//reset timer after 1 hours, 3300<tt<3600 prime number
If tt>=3491 Then
  tt=0
End If
If Dfdebug>0 Then
  Delay Dfdebug*1000
  tt=tt+Dfdebug
End If
Goto run
