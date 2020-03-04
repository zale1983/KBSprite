UserVar hwnd=1111 "Background Window Handle"
Dim colorarea
colorarea=Array(0,0,1024,768,"1317B")
Dim Df1,Df2,Df3,Df4,Df5,Df6,Df7,Df8,Df9,Df10
//seek every 1 second, find next if no attack target
Df1=1
//retry attack every 2 second
Df2=2
//wait 4 second for spell finish or wait 1 second for next round
Df3=4
//buffer micro 30 minutes, cooldown << 30 minutes buffer
Df4=1740
//buffer micro 5 minutes, cooldown << 5 minutes buffer
Df5=240
//buffer micro 10 minutes, cooldown > 10 minutes buffer
Df6=610
//0 for undefined
Df7=0
Df8=0
Df9=0
Df10=5
//mutiple thread for funciton key
If Df1 > 0 Then
BeginThread F1
Delay 10
End If
If Df2 > 0 Then
BeginThread F2
Delay 10
End If
If Df3 > 0 Then
BeginThread F3
Delay 10
End If
If Df4 > 0 Then
BeginThread F4
Delay 10
End If
If Df5 > 0 Then
BeginThread F5
Delay 10
End If
If Df6 > 0 Then
BeginThread F6
Delay 10
End If
If Df7 > 0 Then
BeginThread F7
Delay 10
End If
If Df8 > 0 Then
BeginThread F8
Delay 10
End If
If Df9 > 0 Then
BeginThread F9
Delay 10
End If
If Df10 > 0 Then
BeginThread F10
End If
Delay 10
Sub F1()
//findcolor, then next
  While true
    XY = Plugin.BkgndColor.FindColor(hwnd,colorarea(0),colorarea(1),colorarea(2),colorarea(3),colorarea(4))
    Dim color
    color=Split(XY,"|")
    X=Clng(color(0)): Y=Clng(color(1))
    If X<0 and Y<0 Then
      Plugin.Bkgnd.KeyPress(hwnd,112)
    End If
    For Df1
      Delay 1000
    Next
  Wend
End Sub
Sub F2()
//common attack micro, press every 2 second
  While true
    Plugin.Bkgnd.KeyPress(hwnd,113)
    For Df2
      Delay 1000
    Next
  Wend
End Sub
Sub F3()
//skill attack micro, find target, presss and wait for finish, then press again
  While true
    XY = Plugin.BkgndColor.FindColor(hwnd,colorarea(0),colorarea(1),colorarea(2),colorarea(3),colorarea(4))
    Dim color
    color=Split(XY,"|")
    X=Clng(color(0)): Y=Clng(color(1))
    If X>0 and Y>0 Then
      Plugin.Bkgnd.KeyPress(hwnd,114)
      //wait for spell finish
      For Df3
        Delay 1000
      Next
    Else
      //if no spell target, wait 1 second for next round
      Delay 1000
    End If
  Wend
End Sub
Sub F4()
//buffer micro, press and wait for finish
  While true
    Plugin.Bkgnd.KeyPress(hwnd,115)
    For Df4
      Delay 1000
    Next
  Wend
End Sub
Sub F5()
//buffer micro 2, press and wait for finish
  While true
    Plugin.Bkgnd.KeyPress(hwnd,116)
    For Df5
      Delay 1000
    Next
  Wend
End Sub
Sub F6()
//micro 1, press and wait for finish
  While true
    Plugin.Bkgnd.KeyPress(hwnd,117)
    For Df6
      Delay 1000
    Next
  Wend
End Sub
Sub F7()
//micro 2, press and wait for finish
  While true
    Plugin.Bkgnd.KeyPress(hwnd,118)
    For Df7
      Delay 1000
    Next
  Wend
End Sub
Sub F8()
//micro3, press and wait for finish
  While true
    Plugin.Bkgnd.KeyPress(hwnd,119)
    For Df8
      Delay 1000
    Next
  Wend
End Sub
Sub F9()
//micro4, press and wait for finish
  While true
    Plugin.Bkgnd.KeyPress(hwnd,120)
    For Df9
      Delay 1000
    Next
  Wend
End Sub
Sub F10()
//pickup micro, press and every 5 second
  While true
    Plugin.Bkgnd.KeyPress(hwnd,121)
    For Df5
      Delay 1000
    Next
  Wend
End Sub

