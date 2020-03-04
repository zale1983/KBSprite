UserVar hwnd=1111, "window handle"
Dim colorarea
colorarea=Array(0,0,1024,768,"1317B")
Dim Key1,Key2,Key3,Key4,Key5,Key6,Key7,Key8,Key9,Key0
//key1 attack micro, donot add delay command in micro
//next target, attack, skill*n, delay x(3) second
//array(0), next roud, using -1 for undefined
//array(1), delay after press key1
//array(2), keyid
Key1=Array(-1,3,112)
//30 minutes buffer micro
//skill*n, wait 12 second for spell
Key2=Array(29*60,12,113)
//30 minutes buffer micro 2
//each micro can has 14 command
Key3=Array(29*60,6,114)
//10 minutes buffer micro
//skill*n, wait 2 second for spell, cooldown 10 minutes
Key4=Array(11*60,2,115)
//5minutes buffer micro
//skill*n, wait 4 second for spell, cooldown 2 second
Key5=Array(4*60,4,116)
//interval attack micro
Key6=Array(1*60,3,117)
//-1 for undefined
Key7=Array(-1,-1,118)
Key8=Array(-1,-1,119)
Key9=Array(-1,-1,120)
Key0=Array(-1,-1,121)
Dim key,timer
key=Array(Key2,Key3,Key4,Key5,Key6,Key7,Key8,Key9,Key0)
//-1 for first call
timer=Array(-1,-1,-1,-1,-1,-1,-1,-1,-1,-1)
//spell skill
For i=0 to UBound(key)
  If DateDiff('s',time(i),Now) < Key(i)(0) Then
    Plugin.Bkgnd.KeyPress(hwnd,key(i)(2))
    Delay key(i)(1)*1000
    timer(i)=Now
  End If
Next
//identify blood before attack, else next round
XY = Plugin.BkgndColor.FindColor(hwnd,colorarea(0),colorarea(1),colorarea(2),colorarea(3),colorarea(4))
Dim color
color=Split(XY,"|")
X=Clng(color(0)): Y=Clng(color(1))
If X>0 and Y>0 Then
  Plugin.Bkgnd.KeyPress(hwnd,key1(2))
  Delay key1(1)*1000
Else
  Plugin.Bkgnd.KeyPress(hwnd,key1(2))
End If            

