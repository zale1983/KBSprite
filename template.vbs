UserVar hwnd=1111 "Background Window Handle"
//long run micro need a mutex
Global mutex
mutex=1
Global colorarea
colorarea=Array(0,0,1024,768,"1317B")
Global Df1,Df2,Df3,Df3t,Df4,Df4t,Df5,Df5t,Df6,Df6t,Df7,Df8,Df9,Df10
//0 for undefined
//f1 short run command, no mutex
//f2 short run command, no nutex 
//f3 long run target skill micro, mutex
//f4 long run non-target skill micro, mutex
//f5 long run non-target skill micro 2, mutex
//f6 long run non-taret skill micro 3, mutex
//f7,f8,f9 short run non-target skill, no mutex
//f10 long run pickup micro, no mutex
//f1,f2 never identify mutex
//f7,f8,f9,f10 identify mutex, never lock
Df1=1
Df2=2
//Df3+Df3t=4
Df3=1
Df3t=3
//30/r micro
Df4=1740
Df4t=10
Df5=1740
Df5t=8
//5/r micro
Df6=240
Df6t=6
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
Rem main
//never end main thread
Delay 5000
Goto main
Sub F1()
//findcolor, then next
  While true
    XYf1 = Plugin.BkgndColor.FindColor(hwnd,colorarea(0),colorarea(1),colorarea(2),colorarea(3),colorarea(4))
    Dim colorf1
    colorf1=Split(XYf1,"|")
    Xf1=Clng(colorf1(0)): Yf1=Clng(colorf1(1))
    //if not found, try next
    If Xf1<0 and Yf1<0 Then
      Plugin.Bkgnd.KeyPress(hwnd,112)
    End If
    For Df1
      Delay 1000
    Next
  Wend
End Sub
Sub F2()
  //common attack micro, find target attack 2 second, else try next round every 1 second
  While true
    XYf2 = Plugin.BkgndColor.FindColor(hwnd,colorarea(0),colorarea(1),colorarea(2),colorarea(3),colorarea(4))
    Dim colorf2
    colorf2=Split(XYf2,"|")
    Xf2=Clng(color(0)): Yf2=Clng(color(1))
    If Xf2>0 and Yf2>0 Then
      Plugin.Bkgnd.KeyPress(hwnd,113)
      For Df3
        Delay 1000
      Next
    Else
      //if no target, wait 1 second for next round
      Delay 1000
    End If
  Wend
End Sub
Sub F3()
  //skill attack micro, find target, spell skill and wait for finish, else try next round every 1 second
  While true
    If mutex=1 Then
      Delay 1000
    Else
      XYf3 = Plugin.BkgndColor.FindColor(hwnd,colorarea(0),colorarea(1),colorarea(2),colorarea(3),colorarea(4))
      Dim colorf3
      colorf3=Split(XYf3,"|")
      Xf3=Clng(color(0)): Yf3=Clng(color(1))
      If Xf3>0 and Yf3>0 Then
        mutex=1
        Plugin.Bkgnd.KeyPress(hwnd,114)
        //wait for spell finish
        For Df3t
          Delay 1000
        Next
        mutex=0
        //wait for next round
        For Df3
          Delay 1000
        Next
        mutex=false
      Else
        //if no spell target, wait 1 second for next round
        Delay 1000
      End If
    End If
  Wend
End Sub
Sub F4()
//buffer micro, press and wait for finish
  While true
    If mutex=1 Then
      Delay 1000
    Else
      mutex=1
      Plugin.Bkgnd.KeyPress(hwnd,115)
      //wait for spell finish
      For Df4t
        Delay 1000
      Next
      mutex=0
      //wait for next round
      For Df4
        Delay 1000
      Next
    End If
  Wend
End Sub
Sub F5()
//buffer micro 2, press and wait for finish
  While true
    If mutex=1 Then
      Delay 1000
    Else
      mutex=1
      Plugin.Bkgnd.KeyPress(hwnd,116)
      //wait for spell finish
      For Df5t
        Delay 1000
      Next
      mutex=0
      //wait for next round
      For Df5
        Delay 1000
      Next
  Wend
End Sub
Sub F6()
//micro 1, press and wait for finish
  While true
    If mutex=1 Then
      Delay 1000
    Else
      mutex=1
      Plugin.Bkgnd.KeyPress(hwnd,117)
      For Df6t
        Delay 1000
      Next
      mutex=0
      For Df6
        Delay 1000
      Next
    End If
  Wend
End Sub
Sub F7()
//micro 2, press and wait for finish
  While true
    If mutex=1 Then
      Delay 1000
    Else
      Plugin.Bkgnd.KeyPress(hwnd,118)
      For Df7
        Delay 1000
      Next
    End If
  Wend
End Sub
Sub F8()
//micro3, press and wait for finish
  While true
    If mutex=1 Then
      Delay 1000
    Else
      Plugin.Bkgnd.KeyPress(hwnd,119)
      For Df8
        Delay 1000
      Next
    End If
  Wend
End Sub
Sub F9()
//micro4, press and wait for finish
  While true
    If mutex=1 Then
      Delay 1000
    Else
      Plugin.Bkgnd.KeyPress(hwnd,120)
      For Df9
        Delay 1000
      Next
    End If
  Wend
End Sub
Sub F10()
//pickup micro, press and every 5 second
  While true
    If mutex Then
      Delay 1000
    Else
      Plugin.Bkgnd.KeyPress(hwnd,121)
      For Df5
        Delay 1000
      Next
    End If
  Wend
End Sub

