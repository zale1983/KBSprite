UserVar hwnd=111 "background windows handle"
Dim tt
tt=0
//zhujiao enable f4 shifang, f7 jiaoxue micro, f10 pickup micro
Dim Df1,Df2,Df3,Df4,Df5,Df6,Df7,Df8,Df9,Df10,Dfdebug
Df1=0
Df2=0
Df3=0
Df4=2
Df5=0
Df6=0
Df7=11
Df8=0
Df9=0
Df10=5
Dfdebug=0
Dim Mf1,Mf2,Mf3,Mf4,Mf5,Mf6,Mf7,Mf8,Mf9,Mf10
Mf1=0
Mf2=0
Mf3=0
//shifang every 10 second
Mf4=617
Mf5=0
//consider tt reset condition
Mf6=0
//jinghua,junheng,zhiyu every 30 second
Mf7=37
Mf8=0
Mf9=0
Mf10=71
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
Rem run
//f1-f3, find target / call
//key f1
If Df1>0 Then
  XY=FindTarget()
  If XY(0)<0 and XY(1)<0 Then
    Plugin.Bkgnd.KeyPress(hwnd,112)
    Delay Df1*1000
    tt=tt+Df1
  End If
End If
//key f2
If Df2>0 Then
  XY=FindTarget()
  If XY(0)>0 and XY(1)>0 Then
    Plugin.Bkgnd.KeyPress(hwnd,113)
    Delay Df2*1000
    tt=tt+Df2
  End If
End If
//key f3
If Df3>0 Then
  XY=FindTarget()
  If XY(0)>0 and XY(1)>0 and Df3>0 Then
    Plugin.Bkgnd,KeyPress(hwnd,114)
    Delay Df3*1000
    tt=tt+Df3
  End If
End If
//10 minutes counter, 600<Mf4<660 prime number
//key f4
If Df4>0 and Mf4>0 and (tt Mod Mf4)=0 Then
  Plugin.Bkgnd.KeyPress(hwnd,115)
  Delay Df4*1000
  tt=tt+Df4
End If
//5 minutes counter, 240<Mf5<300 prime number
If Df5>0 and Mf5>0 and (tt Mod Mf5)=0 Then
  Plugin.Bkgnd.KeyPress(hwnd,116)
  Delay Df5*1000
  tt=tt+Df5
End If
//30 minutes counter, 1680<Mf6<1740 prime number
If Df6>0 and Mf6>0 and (tt Mod Mf6)=0 Then
  Plugin.Bkgnd.KeyPress(hwnd,117)
  Delay Df6*1000
  tt=tt+Df6
End If
//undefined counter,
If Df7>0 and Mf7>0 and (tt Mod Mf7)=0 Then
  Plugin.Bkgnd.KeyPress(hwnd,118)
  Delay Df7*1000
  tt=tt+Df7
End If
If Df8>0 and Mf8>0 and (tt Mod Mf8)=0 Then
  Plugin.Bkgnd.KeyPress(hwnd,119)
  Delay Df8*1000
  tt=tt+Df8
End If
If Df9>0 and Mf9>0 and (tt Mod Mf9)=0 Then
  Plugin.Bkgnd.KeyPress(hwnd,120)
  Delay Df9*1000
  tt=tt+Df9
End If
//pickup counter, 60<Mf10<120,
If Df10>0 and Mf10>0 and (tt Mod Mf10)=0 Then
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
