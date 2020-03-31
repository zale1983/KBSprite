UserVar hwnd=111 "background windows handle"
Dim fkdelay,fkspell,fktimer,fkas,fkae,fkes,fkee,fkii,fkit,colorarea
fkdelay=Array(0,0,0,0,0,0,0,0,0,0)
fkspell=Array(0,0,0,0,0,0,0,0,0,0)
fktimer=Array(0,0,0,0,0,0,0,0,0,0)
//interupt timer, buffer check every 13 second
fkii=13
fkit=Now
//attack index
fkas=0
fkae=3
//enhancement index
fkes=4
fkee=8
colorarea=Array(0,0,1024,768,"1317B")
//f1, find target
//f2-f4, target attack, skill attack
//f5-f9, enhancement skill, cycle skill
//f9 cycle micro every 30 second, attack static target
//f10,pickup
//second
fkspell(0)=0.4
fkspell(1)=0.5
fkspell(2)=2
fkdelay(4)=1737
fkspell(4)=4
fkdelay(8)=30
fkspell(8)=1
fkspell(9)=1
//init key timer
For i=0 to 9 step 1
  fktimer(i)=DateAdd("s",-fkdelay(i),Now)
Next
Function FindTarget()
  XY = Plugin.Bkgnd.FindColor(hwnd,colorarea(0),colorarea(1),colorarea(2),colorarea(3),colorarea(4))
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
For i=fkes to fkee step 1
  If fkdelay(i)>0 and DateDiff("s",fktimer(i),Now)>fkdelay(i) Then
    //keymap f1 is 112, index start form 0
    Plugin.Bkgnd.KeyPress hwnd,111+i+1
    //nono second
    Delay fkspell(i)*1000
    fktimer(i)=Now
  End If
Next
Rem RUN
//check enhancement every fkii=13 second
If DateDiff("s",fkit,Now)>fkii Then
  fkit=Now
  Goto ENHANCE
End If
For i=fkas to fkae step 1
  //real attack, target attack, normal delay
  txy=FindTarget()
  If i=0 and txy(0)<0 and txy(1) <0 Then
    //if no target find, pickup, wait, then find next
    Plugin.Bkgnd.KeyPress hwnd, 121
    Delay fkspell(9)*1000
    Plugin.Bkgnd.KeyPress hwnd, 112
    Goto RUN
  End If
  If i>0 and fkspell(i)>0 and txy(0)>0 and txy(1)>0 Then
      //if target find, attack, next fkey, re-check target
      Plugin.Bkgnd.KeyPress hwnd, 111+i+1
      Delay fkspell(i)*1000
  End IF
Next
GOTO RUN
