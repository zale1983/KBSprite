[General]
SyntaxVersion=2
BeginHotkey=36
BeginHotkeyMod=8
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=35
StopHotkeyMod=8
RunOnce=1
EnableWindow=
MacroID=c79a7c12-deac-4062-aa95-e23a6bd4ca13
Description=L2ȭ��
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
//LogStart "V:\Apps\qm\��������2014\Log\t.log"
//file example
//123456
//0,0,0,0,1731,0,0,0,30,0
//0.4,0.5,2,4,6,0,0,0,1,1
//13
//0
//3
//4
//8
//440,23,592,31,"13176F"
Dim configText,configArr,hwnd,fkdelay,fkspell,fkii,fkas,fkae,fkes,fkee,colorarea
configText = Plugin.File.ReadFileEx("V:\Apps\qm\��������2014\QMScript\L2V4\qd.txt")
configArr = Split(configText,"|")
//f1, find target5
//f2-f4, target attack, skill attack
//f5-f9, enhancement skill, cycle skill
//f9 cycle micro every 30 second, attack static target
//f10,pickup
TracePrint UBound(configArr)
If UBound(configArr) = 9 Then
    hwnd=Clng(configArr(0))
    //this is a str array, Clng, convert to long before use
    fkdelay=Split(configArr(1),",")
    fkspell=Split(configArr(2),",")
    //interupt interval, 13 second
    fkii = Cint(configArr(3))
    //TracePrint fkii
    //attack start end key index
    fkas=Cint(configArr(4))
    fkae=Cint(configArr(5))
    //enhancement start end key index
    fkes=Cint(configArr(6))
    fkee=Cint(configArr(7))
    colorarea = Split(configArr(8), ",")
    //TracePrint UBound(colorarea)
    //TracePrint colorarea(4)
End If
//init key timer
Dim fkit,fktimer
fktimer=Array(0,0,0,0,0,0,0,0,0,0)
fkit=Now
For i=0 to 9 step 1
    fktimer(i)=DateAdd("s",-Clng(fkdelay(i)),Now)
Next
Function FindTarget()
    XY = Plugin.Bkgnd.FindColor(hwnd,Clng(colorarea(0)),Clng(colorarea(1)),Clng(colorarea(2)),Clng(colorarea(3)),colorarea(4))
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
    If Clng(fkdelay(i))>0 and DateDiff("s",fktimer(i),Now)>Clng(fkdelay(i)) Then
        //keymap f1 is 112, index start form 0
        Plugin.Bkgnd.KeyPress hwnd,111+i+1
        //nono second
        Delay Clng(fkspell(i))
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
        Delay Clng(fkspell(9))
        Plugin.Bkgnd.KeyPress hwnd, 112
        Goto RUN
    End If
    If i>0 and Clng(fkspell(i))>0 and txy(0)>0 and txy(1)>0 Then
        //if target find, attack, next fkey, re-check target
        Plugin.Bkgnd.KeyPress hwnd, 111+i+1
        Delay Clng(fkspell(i))
    End IF
Next
Goto RUN
//LogStop
