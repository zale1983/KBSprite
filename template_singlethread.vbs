UserVar hwnd=111 "background windows handle"
Dim fkdelay,fkspell
fkdelay=Array(0,0,0,0,0,0,0,0,0,0)
fkspell=Array(0,0,0,0,0,0,0,0,0,0)
//f1, find target
//f2-f4, target attack, skill attack
//f5-f9, enhancement skill
//f10,pickup
//second
fkspell(0)=0.4
fkspell(1)=0.5
fkspell(2)=2
fkdelay(4)=1737
fkspell(4)=4
fkdelay(9)=60
fkspell(9)=1
Dim fktimer(10)
For i=0 to 9 step 1
  fktimer(i)=DateAdd("s",-fkdelay(i),Now)
Next
Dim colorarea
colorarea=Array(0,0,1024,768,"1317B")
Function FindTarget()
  XY = Plugin.Bkgnd.FindColor hwnd,colorarea(0),colorarea(1),colorarea(2),colorarea(3),colorarea(4)
  Dim color,result(2)
  color=Split(XY,"|")
  X=Clng(color(0)): Y=Clng(color(1))
  result(0)=X
  result(1)=Y
  FindTarget=result
End Function
//ready wait
Delay 2000
Rem RUN
For i=4 to 9 step 1
  If fkdelay(i)>0 and DateDiff("s",fktimer(i),Now)>fkdelay(i) Then
    //keymap f1 is 112, index start form 0
    Plugin.Bkgnd.KeyPress hwnd,111+i+1
    //nono second
    Delay fkspell(i)*1000
    fktimer(i)=Now
  End If
Next
Rem FIND
txy=FindTarget()
If txy(0)<0 and txy(1) <0 Then
  Delay fkspell(0)*1000
  Plugin.Bkgnd.KeyPress hwnd, 112
  Goto FIND
End If
For i=1 to 3 step 1
  If fkspell(i)>0 Then
  Plugin.Bkgnd.KeyPress hwnd, 111+i+1
  Delay fkspell(i)*1000
  End IF
Next
Goto RUN
