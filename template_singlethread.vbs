UserVar hwnd=111 "background windows handle"
Dim fkdelay,fkspell,fktimer,fkattack,fkenhance,fkint,colorarea
fkdelay=Array(0,0,0,0,0,0,0,0,0,0)
fkspell=Array(0,0,0,0,0,0,0,0,0,0)
fktimer=Array(0,0,0,0,0,0,0,0,0,0)
//interupt timer, buffer check every 13 second
fkint=Array(13,Now)
//end index
fkattack=3
//start index
fkenhance=4
colorarea=Array(0,0,1024,768,"1317B")
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
For i=fkenhance to 9 step 1
  fktimer(i)=DateAdd("s",-fkdelay(i),Now)
Next
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
Rem ENHANCE
For i=fkenhance to 9 step 1
  If fkdelay(i)>0 and DateDiff("s",fktimer(i),Now)>fkdelay(i) Then
    //keymap f1 is 112, index start form 0
    Plugin.Bkgnd.KeyPress hwnd,111+i+1
    //nono second
    Delay fkspell(i)*1000
    fktimer(i)=Now
  End If
Next
Rem RUN
If DateDiff("s",fkint(1),Now)>fkint(0) Then
  fkint(1)=Now
  Goto ENHANCE
End If
txy=FindTarget()
If txy(0)<0 and txy(1) <0 Then
  Delay fkspell(0)*1000
  Plugin.Bkgnd.KeyPress hwnd, 112
  //if no target find goto start to find next
  Goto RUN
End If
For i=1 to fkattack step 1
  If fkspell(i)>0 Then
  Plugin.Bkgnd.KeyPress hwnd, 111+i+1
  Delay fkspell(i)*1000
  End IF
Next
GOTO RUN
