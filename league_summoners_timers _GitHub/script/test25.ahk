#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
#SingleInstance
#IfWinActive League of Legends


*::
Suspend, Off
Pause, Off, 1
If (toggle := !toggle) {
 Suspend, On
 Pause, On, 1
 Send, {enter}
 Sleep 100
 Send, /OFF
 Send, {enter}
}
Else
{
 Send, {enter}
 Sleep 100
 Send, /ON
 Send, {enter}
}
Return




matchStarted := false

F10::
matchStarted := false
;matchStarted := False
champ1Flash := True
champ2Flash := True
champ3Flash := True
champ4Flash := True
champ5Flash := True

champ1Boots := False
champ2Boots := False
champ3Boots := False
champ4Boots := False
champ5Boots := False

champ1Rune := x
champ2Rune := x
champ3Rune := x
champ4Rune := x
champ5Rune := x

roleSelected := None

champ1Spell1 := x
champ2Spell1 := x
champ3Spell1 := x
champ4Spell1 := x
champ5Spell1 := x

champ1Spell2 := x
champ2Spell2 := x
champ3Spell2 := x
champ4Spell2 := x
champ5Spell2 := x

champ1Spell1Name := x
champ2Spell1Name := x
champ3Spell1Name := x
champ4Spell1Name := x
champ5Spell1Name := x


champion1Name := x
champion2Name := x
champion3Name := x
champion4Name := x
champion5Name := x

champ1Spell2Name := x
champ2Spell2Name := x
champ3Spell2Name := x
champ4Spell2Name := x
champ5Spell2Name := x


champ3Spell1Bool := True
champ3Spell2Bool := True
champ1Spell1Bool := True
champ1Spell2Bool := True
champ2Spell1Bool := True
champ2Spell2Bool := True
champ4Spell1Bool := True
champ4Spell2Bool := True
champ5Spell1Bool := True
champ5Spell2Bool := True

messageChamp1 := None
messageChamp2 := None
messageChamp3 := None
messageChamp4 := None
messageChamp5 := None


k::
Send, {enter}
Sleep, 100
Send, /The_keys_for_this_game_are_:_CHAMP1==*///CHAMP2==*///CHAMP3==*///CHAMP4==*///CHAMP5==*
Send, {enter}
Return







if(matchStarted == false)
{
    Send, {enter}
    Sleep, 100
    Send, /match_starting
    Send, {enter}
    Sleep, 100
    Send, {enter}
    Sleep, 100
    Send, /The_keys_for_this_game_are_:_CHAMP1==*///CHAMP2==*///CHAMP3==*///CHAMP4==*///CHAMP5==*
    Send, {enter}

    matchStart := A_TickCount - 10000
    matchStarted := True


}
Else
{
    Send, {enter}
    Sleep 100
    Send, /match_ended
    Send, {enter}
    matchStarted := False 
}
return



ms2hms(milli, ByRef hours=0, ByRef mins=0, ByRef secs=0, secPercision=0)
{
    SetFormat, FLOAT, 0.%secPercision%
    milli /= 1000.0
    secs := mod(milli, 60)
    SetFormat, FLOAT, 0.0
    milli //= 60
    mins := mod(milli, 60)
    hours := milli //60
    return mins . "." . secs
}







keyForChamp3 & &::
if (champ3Boots and champ3Rune)
{
    champ3FullCdr := 30
}
Else if (champ3Boots and champ3Rune == False)
{
    champ3FullCdr := 12
}
Else if (champ3Boots == False and champ3Rune)
{
    champ3FullCdr := 18
}
Else if (champ3Boots == false and champ3Rune == false)
{
    champ3FullCdr := 0
}
champ3Spell1Bool := False
champ3CountTimeSinceSpell1Used := A_TickCount
champ3ActualTimeWhenSpell1Used := A_TickCount - matchStart
Send, {enter}
Sleep 100
Send, No %champ3Spell1Name% %champion3Name%
Sleep 100
Send, {enter}
testChamp31 := champ3Spell1*(1-champ3FullCdr/100)
SetTimer, champ3TimerSpell1, %testChamp31%
Return


keyForChamp3 & 2::
if (champ3Boots and champ3Rune)
{
    champ3FullCdr := 30
}
Else if (champ3Boots and champ3Rune == False)
{
    champ3FullCdr := 12
}
Else if (champ3Boots == False and champ3Rune)
{
    champ3FullCdr := 18
}
Else if (champ3Boots == false and champ3Rune == false)
{
    champ3FullCdr := 0
}
champ3Spell2Bool := False
champ3CountTimeSinceSpell2Used := A_TickCount
champ3ActualTimeWhenSpell2Used := A_TickCount - matchStart
Send, {enter}
Sleep 100
Send, No %champ3Spell2Name% %champion3Name%
Sleep 100
Send, {enter}
testChamp32 := champ3Spell2 *(1-champ3FullCdr/100)
SetTimer, champ3TimerSpell2, %testChamp32%
Return



keyForChamp1 & &::
if (champ1Boots and champ1Rune)
{
    champ1FullCdr := 30
}
Else if (champ1Boots and champ1Rune == False)
{
    champ1FullCdr := 12
}
Else if (champ1Boots == False and champ1Rune)
{
    champ1FullCdr := 18
}
Else if (champ1Boots == false and champ1Rune == false)
{
    champ1FullCdr := 0
}
champ1Spell1Bool := False
champ1CountTimeSinceSpell1Used := A_TickCount
champ1ActualTimeWhenSpell1Used := A_TickCount - matchStart
Send, {enter}
Sleep 100
Send, No %champ1Spell1Name% %champion1Name%
Sleep 100
Send, {enter}
testChamp11 := champ1Spell1*(1-champ1FullCdr/100)
SetTimer, champ1TimerSpell1, %testChamp11%
Return

keyForChamp1 & 2::
if (champ1Boots and champ1Rune)
{
    champ1FullCdr := 30
}
Else if (champ1Boots and champ1Rune == False)
{
    champ1FullCdr := 12
}
Else if (champ1Boots == False and champ1Rune)
{
    champ1FullCdr := 18
}
Else if (champ1Boots == false and champ1Rune == false)
{
    champ1FullCdr := 0
}
champ1Spell2Bool := False
champ1CountTimeSinceSpell2Used := A_TickCount
champ1ActualTimeWhenSpell2Used := A_TickCount - matchStart
Send, {enter}
Sleep 100
Send, No %champ1Spell2Name% %champion1Name%
Sleep 100
Send, {enter}
testChamp12 := champ1Spell2 *(1-champ1FullCdr/100)
SetTimer, champ1TimerSpell2, %testChamp12%
Return

keyForChamp2 & &::
if (champ2Boots and champ2Rune)
{
    champ2FullCdr := 30
}
Else if (champ2Boots and champ2Rune == False)
{
    champ2FullCdr := 12
}
Else if (champ2Boots == False and champ2Rune)
{
    champ2FullCdr := 18
}
Else if (champ2Boots == false and champ2Rune == false)
{
    champ2FullCdr := 0
}
champ2Spell1Bool := False
champ2CountTimeSinceSpell1Used := A_TickCount
champ2ActualTimeWhenSpell1Used := A_TickCount - matchStart
Send, {enter}
Sleep 100
Send, No %champ2Spell1Name% %champion2Name%
Sleep 100
Send, {enter}
testChamp21 := champ2Spell1*(1-champ2FullCdr/100)
SetTimer, champ2TimerSpell1, %testChamp21%
Return

keyForChamp2 & 2::
if (champ2Boots and champ2Rune)
{
    champ2FullCdr := 30
}
Else if (champ2Boots and champ2Rune == False)
{
    champ2FullCdr := 12
}
Else if (champ2Boots == False and champ2Rune)
{
    champ2FullCdr := 18
}
Else if (champ2Boots == false and champ2Rune == false)
{
    champ2FullCdr := 0
}
champ2Spell2Bool := False
champ2CountTimeSinceSpell2Used := A_TickCount
champ2ActualTimeWhenSpell2Used := A_TickCount - matchStart
Send, {enter}
Sleep 100
Send, No %champ2Spell2Name% %champion2Name%
Sleep 100
Send, {enter}
testChamp22 := champ2Spell2 *(1-champ2FullCdr/100)
SetTimer, champ2TimerSpell2, %testChamp22%
Return

keyForChamp4 & &::
if (champ4Boots and champ4Rune)
{
    champ4FullCdr := 30
}
Else if (champ4Boots and champ4Rune == False)
{
    champ4FullCdr := 12
}
Else if (champ4Boots == False and champ4Rune)
{
    champ4FullCdr := 18
}
Else if (champ4Boots == false and champ4Rune == false)
{
    champ4FullCdr := 0
}
champ4Spell1Bool := False
champ4CountTimeSinceSpell1Used := A_TickCount
champ4ActualTimeWhenSpell1Used := A_TickCount - matchStart
Send, {enter}
Sleep 100
Send, No %champ4Spell1Name% %champion4Name%
Sleep 100
Send, {enter}
testChamp41 := champ4Spell1*(1-champ4FullCdr/100)
SetTimer, champ4TimerSpell1, %testChamp41%
Return

keyForChamp4 & 2::
if (champ4Boots and champ4Rune)
{
    champ4FullCdr := 30
}
Else if (champ4Boots and champ4Rune == False)
{
    champ4FullCdr := 12
}
Else if (champ4Boots == False and champ4Rune)
{
    champ4FullCdr := 18
}
Else if (champ4Boots == false and champ4Rune == false)
{
    champ4FullCdr := 0
}
champ4Spell2Bool := False
champ4CountTimeSinceSpell2Used := A_TickCount
champ4ActualTimeWhenSpell2Used := A_TickCount - matchStart
Send, {enter}
Sleep 100
Send, No %champ4Spell2Name% %champion4Name%
Sleep 100
Send, {enter}
testChamp42 := champ4Spell2 *(1-champ4FullCdr/100)
SetTimer, champ4TimerSpell2, %testChamp42%
Return

keyForChamp5 & &::
if (champ5Boots and champ5Rune)
{
    champ5FullCdr := 30
}
Else if (champ5Boots and champ5Rune == False)
{
    champ5FullCdr := 12
}
Else if (champ5Boots == False and champ5Rune)
{
    champ5FullCdr := 18
}
Else if (champ5Boots == false and champ5Rune == false)
{
    champ5FullCdr := 0
}
champ5Spell1Bool := False
champ5CountTimeSinceSpell1Used := A_TickCount
champ5ActualTimeWhenSpell1Used := A_TickCount - matchStart
testChamp51 := champ5Spell1*(1-champ5FullCdr/100)
SetTimer, champ5TimerSpell1, %testChamp51%
Send, {enter}
Sleep 100
Send, No %champ5Spell1Name% %champion5Name%
Sleep 100
Send, {enter}
Return

keyForChamp5 & 2::
if (champ5Boots and champ5Rune)
{
    champ5FullCdr := 30
}
Else if (champ5Boots and champ5Rune == False)
{
    champ5FullCdr := 12
}
Else if (champ5Boots == False and champ5Rune)
{
    champ5FullCdr := 18
}
Else if (champ5Boots == false and champ5Rune == false)
{
    champ5FullCdr := 0
}
champ5Spell2Bool := False
champ5CountTimeSinceSpell2Used := A_TickCount
champ5ActualTimeWhenSpell2Used := A_TickCount - matchStart
Send, {enter}
Sleep 100
Send, No %champ5Spell2Name% %champion5Name%
Sleep 100
Send, {enter}
testChamp52 := champ5Spell2 *(1-champ5FullCdr/100)
SetTimer, champ5TimerSpell2, %testChamp52%
Return



;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
champ3TimerSpell1:
champ3Spell1Bool := True
return

champ3TimerSpell2:
champ3Spell2Bool := True
return

champ1TimerSpell1:
champ1Spell1Bool := True
return

champ1TimerSpell2:
champ1Spell2Bool := True
return

champ2TimerSpell1:
champ2Spell1Bool := True
return

champ2TimerSpell2:
champ2Spell2Bool := True
return

champ4TimerSpell1:
champ4Spell1Bool := True
return

champ4TimerSpell2:
champ4Spell2Bool := True
return

champ5TimerSpell1:
champ5Spell1Bool := True
return

champ5TimerSpell2:
champ5Spell2Bool := True
return



^keyForChamp3::
if (champ3Boots and champ3Rune)
{
    champ3FullCdr := 30
}
Else if (champ3Boots and champ3Rune == False)
{
    champ3FullCdr := 12
}
Else if (champ3Boots == False and champ3Rune)
{
    champ3FullCdr := 18
}
Else if (champ3Boots == false and champ3Rune == false)
{
    champ3FullCdr := 0
}

champ3TimeSinceSpell1Used := A_TickCount - champ3CountTimeSinceSpell1Used
champ3TimeSinceSpell2Used := A_TickCount - champ3CountTimeSinceSpell2Used

champ3Spell1ConvertedToMinLeft := % ms2hms(((champ3Spell1-10000)*(1-champ3FullCdr/100))-1000-champ3TimeSinceSpell1Used)
champ3Spell1ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ3ActualTimeWhenSpell1Used+(champ3Spell1*(1-champ3FullCdr/100)))

champ3Spell2ConvertedToMinLeft := % ms2hms(((champ3Spell2-10000)*(1-champ3FullCdr/100))-1000-champ3TimeSinceSpell2Used)
champ3Spell2ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ3ActualTimeWhenSpell2Used+(champ3Spell2*(1-champ3FullCdr/100)))

if (champ3Spell1Bool)
{
if(champ3Spell2Bool == false)
{
    messageChamp3 := champ3 has champ3Spell1Name but champ3Spell2Name in champ3Spell2ConvertedToMinLeft
    Send, {enter}
    Sleep 100
	Send, %champion3Name% has %champ3Spell1Name% but %champ3Spell2Name% in %champ3Spell2ConvertedToMinLeft%
    Sleep 100
    Send, {enter}
}
Else if(champ3Spell2Bool)
{
    messageChamp3 := None
    Send, {enter}
    Sleep 100
	Send, %champion3Name% has both summs
    Sleep 100
    Send, {enter}   
}
}

Else if (champ3Spell1Bool==false)
{
if(champ3Spell2bool)
{
    messageChamp3 := champ3 has champ3Spell2Name but champ3Spell1Name in champ3Spell1ConvertedToMinLeft at champ3Spell1ConvertedToTimeAtWhenItWillBeBack
    Send, {enter}
    Sleep 100
    Send, %champion3Name% has %champ3Spell2Name% but %champ3Spell1Name% in %champ3Spell1ConvertedToMinLeft% at %champ3Spell1ConvertedToTimeAtWhenItWillBeBack% 
    Sleep 100
    Send, {enter}    
}
Else if(champ3Spell2bool==false)
{
    messageChamp3 := champ3 has champ3Spell1Name in champ3Spell1ConvertedToMinLeft and champ3Spell2Name in champ3Spell2ConvertedToMinLeft
    Send, {enter}
    Sleep 100
    Send, %champion3Name% has %champ3Spell1Name% in %champ3Spell1ConvertedToMinLeft% and %champ3Spell2Name% in %champ3Spell2ConvertedToMinLeft%
    Sleep 100
    Send, {enter}     
}
}
Return

^keyForChamp1::
if (champ1Boots and champ1Rune)
{
    champ1FullCdr := 30
}
Else if (champ1Boots and champ1Rune == False)
{
    champ1FullCdr := 12
}
Else if (champ1Boots == False and champ1Rune)
{
    champ1FullCdr := 18
}
Else if (champ1Boots == false and champ1Rune == false)
{
    champ1FullCdr := 0
}

champ1TimeSinceSpell1Used := A_TickCount - champ1CountTimeSinceSpell1Used
champ1TimeSinceSpell2Used := A_TickCount - champ1CountTimeSinceSpell2Used

champ1Spell1ConvertedToMinLeft := % ms2hms(((champ1Spell1-10000)*(1-champ1FullCdr/100))-1000-champ1TimeSinceSpell1Used)
champ1Spell1ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ1ActualTimeWhenSpell1Used+(champ1Spell1*(1-champ1FullCdr/100)))

champ1Spell2ConvertedToMinLeft := % ms2hms(((champ1Spell2-10000)*(1-champ1FullCdr/100))-1000-champ1TimeSinceSpell2Used)
champ1Spell2ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ1ActualTimeWhenSpell2Used+(champ1Spell2*(1-champ1FullCdr/100)))

if (champ1Spell1Bool)
{
if(champ1Spell2Bool == false)
{
    messageChamp1 := Send champ1 has champ1Spell1Name but champ1Spell2Name in champ1Spell2ConvertedToMinLeft
    Send, {enter}
    Sleep 100
	Send, %champion1Name% has %champ1Spell1Name% but %champ1Spell2Name% in %champ1Spell2ConvertedToMinLeft%
    Sleep 100
    Send, {enter}
}
Else if(champ1Spell2Bool)
{
    messageChamp1 = None
    Send, {enter}
    Sleep 100
	Send, %champion1Name% has both summs
    Sleep 100
    Send, {enter}   
}
}

Else if (champ1Spell1Bool==false)
{
if(champ1Spell2bool)
{
    messageChamp1 = champ1 has champ1Spell2Name but champ1Spell1Name in champ1Spell1ConvertedToMinLeft
    Send, {enter}
    Sleep 100
    Send, %champion1Name% has %champ1Spell2Name% but %champ1Spell1Name% in %champ1Spell1ConvertedToMinLeft%
    Sleep 100
    Send, {enter}    
}
Else if(champ1Spell2bool==false)
{
    messageChamp1 = champ1 has %champ1Spell1Name% in %champ1Spell1ConvertedToMinLeft% and %champ1Spell2Name% in %champ1Spell2ConvertedToMinLeft%
    Send, {enter}
    Sleep 100
    Send, %champion1Name% has %champ1Spell1Name% in %champ1Spell1ConvertedToMinLeft% and %champ1Spell2Name% in %champ1Spell2ConvertedToMinLeft%
    Sleep 100
    Send, {enter}     
}
}
Return

^keyForChamp2::
if (champ2Boots and champ2Rune)
{
    champ2FullCdr := 30
}
Else if (champ2Boots and champ2Rune == False)
{
    champ2FullCdr := 12
}
Else if (champ2Boots == False and champ2Rune)
{
    champ2FullCdr := 18
}
Else if (champ2Boots == false and champ2Rune == false)
{
    champ2FullCdr := 0
}

champ2TimeSinceSpell1Used := A_TickCount - champ2CountTimeSinceSpell1Used
champ2TimeSinceSpell2Used := A_TickCount - champ2CountTimeSinceSpell2Used

champ2Spell1ConvertedToMinLeft := % ms2hms(((champ2Spell1-10000)*(1-champ2FullCdr/100))-1000-champ2TimeSinceSpell1Used)
champ2Spell1ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ2ActualTimeWhenSpell1Used+(champ2Spell1*(1-champ2FullCdr/100)))

champ2Spell2ConvertedToMinLeft := % ms2hms(((champ2Spell2-10000)*(1-champ2FullCdr/100))-1000-champ2TimeSinceSpell2Used)
champ2Spell2ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ2ActualTimeWhenSpell2Used+(champ2Spell2*(1-champ2FullCdr/100)))

if (champ2Spell1Bool)
{
if(champ2Spell2Bool == false)
{
    messageChamp2 := champ2 has champ2Spell1Name but champ2Spell2Name in champ2Spell2ConvertedToMinLeft
    Send, {enter}
    Sleep 100
	Send, %champion2Name% has %champ2Spell1Name% but %champ2Spell2Name% in %champ2Spell2ConvertedToMinLeft%
    Sleep 100
    Send, {enter}
}
Else if(champ2Spell2Bool)
{
    messageChamp2 := None
    Send, {enter}
    Sleep 100
	Send, %champion2Name% has both summs
    Sleep 100
    Send, {enter}   
}
}

Else if (champ2Spell1Bool==false)
{
if(champ2Spell2bool)
{
    messageChamp2 := champ2 has champ2Spell2Name but champ2Spell1Name in champ2Spell1ConvertedToMinLeft
    Send, {enter}
    Sleep 100
    Send, %champion2Name% has %champ2Spell2Name% but %champ2Spell1Name% in %champ2Spell1ConvertedToMinLeft%
    Sleep 100
    Send, {enter}    
}
Else if(champ2Spell2bool==false)
{
    messageChamp2 := champ2 has champ2Spell1Name in champ2Spell1ConvertedToMinLeft and champ2Spell2Name in champ2Spell2ConvertedToMinLeft
    Send, {enter}
    Sleep 100
    Send, %champion2Name% has %champ2Spell1Name% in %champ2Spell1ConvertedToMinLeft% and %champ2Spell2Name% in %champ2Spell2ConvertedToMinLeft%
    Sleep 100
    Send, {enter}     
}
}
Return

^keyForChamp4::
if (champ4Boots and champ4Rune)
{
    champ4FullCdr := 30
}
Else if (champ4Boots and champ4Rune == False)
{
    champ4FullCdr := 12
}
Else if (champ4Boots == False and champ4Rune)
{
    champ4FullCdr := 18
}
Else if (champ4Boots == false and champ4Rune == false)
{
    champ4FullCdr := 0
}

champ4TimeSinceSpell1Used := A_TickCount - champ4CountTimeSinceSpell1Used
champ4TimeSinceSpell2Used := A_TickCount - champ4CountTimeSinceSpell2Used

champ4Spell1ConvertedToMinLeft := % ms2hms(((champ4Spell1-10000)*(1-champ4FullCdr/100))-1000-champ4TimeSinceSpell1Used)
champ4Spell1ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ4ActualTimeWhenSpell1Used+(champ4Spell1*(1-champ4FullCdr/100)))

champ4Spell2ConvertedToMinLeft := % ms2hms(((champ4Spell2-10000)*(1-champ4FullCdr/100))-1000-champ4TimeSinceSpell2Used)
champ4Spell2ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ4ActualTimeWhenSpell2Used+(champ4Spell2*(1-champ4FullCdr/100)))

if (champ4Spell1Bool)
{
if(champ4Spell2Bool == false)
{
    messageChamp4 := champ4 has champ4Spell1Name but champ4Spell2Name in champ4Spell2ConvertedToMinLeft
    Send, {enter}
    Sleep 100
	Send, %champion4Name% has %champ4Spell1Name% but %champ4Spell2Name% in %champ4Spell2ConvertedToMinLeft%
    Sleep 100
    Send, {enter}
}
Else if(champ4Spell2Bool)
{
    messageChamp4 := None
    Send, {enter}
    Sleep 100
	Send, %champion4Name% has both summs
    Sleep 100
    Send, {enter}   
}
}

Else if (champ4Spell1Bool==false)
{
if(champ4Spell2bool)
{
    messageChamp4 := champ4 has champ4Spell2Name but champ4Spell1Name in champ4Spell1ConvertedToMinLeft
    Send, {enter}
    Sleep 100
    Send, %champion4Name% has %champ4Spell2Name% but %champ4Spell1Name% in %champ4Spell1ConvertedToMinLeft% 
    Sleep 100
    Send, {enter}    
}
Else if(champ4Spell2bool==false)
{
    messageChamp4 := champ4 has champ4Spell1Name in champ4Spell1ConvertedToMinLeft and champ4Spell2Name in champ4Spell2ConvertedToMinLeft
    Send, {enter}
    Sleep 100
    Send, %champion4Name% has %champ4Spell1Name% in %champ4Spell1ConvertedToMinLeft% and %champ4Spell2Name% in %champ4Spell2ConvertedToMinLeft%
    Sleep 100
    Send, {enter}     
}
}
Return


^keyForChamp5::
if (champ5Boots and champ5Rune)
{
    champ5FullCdr := 30
}
Else if (champ5Boots and champ5Rune == False)
{
    champ5FullCdr := 12
}
Else if (champ5Boots == False and champ5Rune)
{
    champ5FullCdr := 18
}
Else if (champ5Boots == false and champ5Rune == false)
{
    champ5FullCdr := 0
}

champ5TimeSinceSpell1Used := A_TickCount - champ5CountTimeSinceSpell1Used
champ5TimeSinceSpell2Used := A_TickCount - champ5CountTimeSinceSpell2Used

champ5Spell1ConvertedToMinLeft := % ms2hms(((champ5Spell1-10000)*(1-champ5FullCdr/100))-1000-champ5TimeSinceSpell1Used)
champ5Spell1ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ5ActualTimeWhenSpell1Used+(champ5Spell1*(1-champ5FullCdr/100)))

champ5Spell2ConvertedToMinLeft := % ms2hms(((champ5Spell2-10000)*(1-champ5FullCdr/100))-1000-champ5TimeSinceSpell2Used)
champ5Spell2ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ5ActualTimeWhenSpell2Used+(champ5Spell2*(1-champ5FullCdr/100)))

if (champ5Spell1Bool)
{
if(champ5Spell2Bool == false)
{
    messageChamp5 := champ5 has champ5Spell1Name but champ5Spell2Name in champ5Spell2ConvertedToMinLeft
    Send, {enter}
    Sleep 100
	Send, %champion5Name% has %champ5Spell1Name% but %champ5Spell2Name% in %champ5Spell2ConvertedToMinLeft% at %champ5Spell2ConvertedToTimeAtWhenItWillBeBack%
    Sleep 100
    Send, {enter}
}
Else if(champ5Spell2Bool)
{
    messageChamp5 := None
    Send, {enter}
    Sleep 100
	Send, %champion5Name% has both summs
    Sleep 100
    Send, {enter}   
}
}

Else if (champ5Spell1Bool==false)
{
if(champ5Spell2bool)
{

    Send, {enter}
    Sleep 100
    Send, %champion5Name% has %champ5Spell1Name% in %champ5Spell1ConvertedToMinLeft%
    Sleep 100
    Send, {enter}    
}
Else if(champ5Spell2bool==false)
{

    Send, {enter}
    Sleep 100
    Send, %champion5Name% has %champ5Spell1Name% in %champ5Spell1ConvertedToMinLeft% and %champ5Spell2Name% in %champ5Spell2ConvertedToMinLeft% 
    Sleep 100
    Send, {enter}     
}
}
Return


F1::
if (champ3Boots and champ3Rune)
{
    champ3FullCdr := 30
}
Else if (champ3Boots and champ3Rune == False)
{
    champ3FullCdr := 12
}
Else if (champ3Boots == False and champ3Rune)
{
    champ3FullCdr := 18
}
Else if (champ3Boots == false and champ3Rune == false)
{
    champ3FullCdr := 0
}

champ3TimeSinceSpell1Used := A_TickCount - champ3CountTimeSinceSpell1Used
champ3TimeSinceSpell2Used := A_TickCount - champ3CountTimeSinceSpell2Used

champ3Spell1ConvertedToMinLeft := % ms2hms(((champ3Spell1-10000)*(1-champ3FullCdr/100))-1000-champ3TimeSinceSpell1Used)
champ3Spell1ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ3ActualTimeWhenSpell1Used+(champ3Spell1*(1-champ3FullCdr/100)))

champ3Spell2ConvertedToMinLeft := % ms2hms(((champ3Spell2-10000)*(1-champ3FullCdr/100))-1000-champ3TimeSinceSpell2Used)
champ3Spell2ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ3ActualTimeWhenSpell2Used+(champ3Spell2*(1-champ3FullCdr/100)))

if (champ3Spell1Bool)
{
if(champ3Spell2Bool == false)
{
    Send, {enter}
    Sleep 100
	Send, %champion3Name% has %champ3Spell2Name% in %champ3Spell2ConvertedToMinLeft%
    Sleep 100
    Send, {enter}
}

}

Else if (champ3Spell1Bool==false)
{
if(champ3Spell2bool)
{
    Send, {enter}
    Sleep 100
    Send, %champion3Name% has %champ3Spell1Name% in %champ3Spell1ConvertedToMinLeft%
    Sleep 100
    Send, {enter}    
}
Else if(champ3Spell2bool==false)
{
    Send, {enter}
    Sleep 100
    Send, %champion3Name% has %champ3Spell1Name% in %champ3Spell1ConvertedToMinLeft% and %champ3Spell2Name% in %champ3Spell2ConvertedToMinLeft%
    Sleep 100
    Send, {enter}     
}
}
Sleep 100

if (champ1Boots and champ1Rune)
{
    champ1FullCdr := 30
}
Else if (champ1Boots and champ1Rune == False)
{
    champ1FullCdr := 12
}
Else if (champ1Boots == False and champ1Rune)
{
    champ1FullCdr := 18
}
Else if (champ1Boots == false and champ1Rune == false)
{
    champ1FullCdr := 0
}

champ1TimeSinceSpell1Used := A_TickCount - champ1CountTimeSinceSpell1Used
champ1TimeSinceSpell2Used := A_TickCount - champ1CountTimeSinceSpell2Used

champ1Spell1ConvertedToMinLeft := % ms2hms(((champ1Spell1-10000)*(1-champ1FullCdr/100))-1000-champ1TimeSinceSpell1Used)
champ1Spell1ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ1ActualTimeWhenSpell1Used+(champ1Spell1*(1-champ1FullCdr/100)))

champ1Spell2ConvertedToMinLeft := % ms2hms(((champ1Spell2-10000)*(1-champ1FullCdr/100))-1000-champ1TimeSinceSpell2Used)
champ1Spell2ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ1ActualTimeWhenSpell2Used+(champ1Spell2*(1-champ1FullCdr/100)))

if (champ1Spell1Bool)
{
if(champ1Spell2Bool == false)
{
    Send, {enter}
    Sleep 100
	Send, %champion1Name% has %champ1Spell2Name% in %champ1Spell2ConvertedToMinLeft%
    Sleep 100
    Send, {enter}
}

}

Else if (champ1Spell1Bool==false)
{
if(champ1Spell2bool)
{
    Send, {enter}
    Sleep 100
    Send, %champion1Name% has %champ1Spell1Name% in %champ1Spell1ConvertedToMinLeft%
    Sleep 100
    Send, {enter}    
}
Else if(champ1Spell2bool==false)
{
    Send, {enter}
    Sleep 100
    Send, %champion1Name% has %champ1Spell1Name% in %champ1Spell1ConvertedToMinLeft% and %champ1Spell2Name% in %champ1Spell2ConvertedToMinLeft%
    Sleep 100
    Send, {enter}     
}
}


Sleep 100
if (champ2Boots and champ2Rune)
{
    champ2FullCdr := 30
}
Else if (champ2Boots and champ2Rune == False)
{
    champ2FullCdr := 12
}
Else if (champ2Boots == False and champ2Rune)
{
    champ2FullCdr := 18
}
Else if (champ2Boots == false and champ2Rune == false)
{
    champ2FullCdr := 0
}

champ2TimeSinceSpell1Used := A_TickCount - champ2CountTimeSinceSpell1Used
champ2TimeSinceSpell2Used := A_TickCount - champ2CountTimeSinceSpell2Used

champ2Spell1ConvertedToMinLeft := % ms2hms(((champ2Spell1-10000)*(1-champ2FullCdr/100))-1000-champ2TimeSinceSpell1Used)
champ2Spell1ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ2ActualTimeWhenSpell1Used+(champ2Spell1*(1-champ2FullCdr/100)))

champ2Spell2ConvertedToMinLeft := % ms2hms(((champ2Spell2-10000)*(1-champ2FullCdr/100))-1000-champ2TimeSinceSpell2Used)
champ2Spell2ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ2ActualTimeWhenSpell2Used+(champ2Spell2*(1-champ2FullCdr/100)))

if (champ2Spell1Bool)
{
if(champ2Spell2Bool == false)
{

    Send, {enter}
    Sleep 100
	Send, %champion2Name% has %champ2Spell2Name% in %champ2Spell2ConvertedToMinLeft%
    Sleep 100
    Send, {enter}
}

}

Else if (champ2Spell1Bool==false)
{
if(champ2Spell2bool)
{

    Send, {enter}
    Sleep 100
    Send, %champion2Name% has %champ2Spell1Name% in %champ2Spell1ConvertedToMinLeft%
    Sleep 100
    Send, {enter}    
}
Else if(champ2Spell2bool==false)
{

    Send, {enter}
    Sleep 100
    Send, %champion2Name% has %champ2Spell1Name% in %champ2Spell1ConvertedToMinLeft% and %champ2Spell2Name% in %champ2Spell2ConvertedToMinLeft%
    Sleep 100
    Send, {enter}     
}
}

Sleep 100

if (champ4Boots and champ4Rune)
{
    champ4FullCdr := 30
}
Else if (champ4Boots and champ4Rune == False)
{
    champ4FullCdr := 12
}
Else if (champ4Boots == False and champ4Rune)
{
    champ4FullCdr := 18
}
Else if (champ4Boots == false and champ4Rune == false)
{
    champ4FullCdr := 0
}

champ4TimeSinceSpell1Used := A_TickCount - champ4CountTimeSinceSpell1Used
champ4TimeSinceSpell2Used := A_TickCount - champ4CountTimeSinceSpell2Used

champ4Spell1ConvertedToMinLeft := % ms2hms(((champ4Spell1-10000)*(1-champ4FullCdr/100))-1000-champ4TimeSinceSpell1Used)
champ4Spell1ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ4ActualTimeWhenSpell1Used+(champ4Spell1*(1-champ4FullCdr/100)))

champ4Spell2ConvertedToMinLeft := % ms2hms(((champ4Spell2-10000)*(1-champ4FullCdr/100))-1000-champ4TimeSinceSpell2Used)
champ4Spell2ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ4ActualTimeWhenSpell2Used+(champ4Spell2*(1-champ4FullCdr/100)))

if (champ4Spell1Bool)
{
if(champ4Spell2Bool == false)
{
    Send, {enter}
    Sleep 100
	Send, %champion4Name% has %champ4Spell2Name% in %champ4Spell2ConvertedToMinLeft%
    Sleep 100
    Send, {enter}
}

}

Else if (champ4Spell1Bool==false)
{
if(champ4Spell2bool)
{
    messageChamp4 := champ4 has champ4Spell2Name but champ4Spell1Name in champ4Spell1ConvertedToMinLeft
    Send, {enter}
    Sleep 100
    Send, %champion4Name% has %champ4Spell1Name% in %champ4Spell1ConvertedToMinLeft% 
    Sleep 100
    Send, {enter}    
}
Else if(champ4Spell2bool==false)
{
    messageChamp4 := champ4 has champ4Spell1Name in champ4Spell1ConvertedToMinLeft and champ4Spell2Name in champ4Spell2ConvertedToMinLeft
    Send, {enter}
    Sleep 100
    Send, %champion4Name% has %champ4Spell1Name% in %champ4Spell1ConvertedToMinLeft% and %champ4Spell2Name% in %champ4Spell2ConvertedToMinLeft%
    Sleep 100
    Send, {enter}     
}
}



Sleep 100


if (champ5Boots and champ5Rune)
{
    champ5FullCdr := 30
}
Else if (champ5Boots and champ5Rune == False)
{
    champ5FullCdr := 12
}
Else if (champ5Boots == False and champ5Rune)
{
    champ5FullCdr := 18
}
Else if (champ5Boots == false and champ5Rune == false)
{
    champ5FullCdr := 0
}

champ5TimeSinceSpell1Used := A_TickCount - champ5CountTimeSinceSpell1Used
champ5TimeSinceSpell2Used := A_TickCount - champ5CountTimeSinceSpell2Used

champ5Spell1ConvertedToMinLeft := % ms2hms(((champ5Spell1-10000)*(1-champ5FullCdr/100))-1000-champ5TimeSinceSpell1Used)
champ5Spell1ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ5ActualTimeWhenSpell1Used+(champ5Spell1*(1-champ5FullCdr/100)))

champ5Spell2ConvertedToMinLeft := % ms2hms(((champ5Spell2-10000)*(1-champ5FullCdr/100))-1000-champ5TimeSinceSpell2Used)
champ5Spell2ConvertedToTimeAtWhenItWillBeBack := % ms2hms(champ5ActualTimeWhenSpell2Used+(champ5Spell2*(1-champ5FullCdr/100)))

if (champ5Spell1Bool)
{
if(champ5Spell2Bool == false)
{
    messageChamp5 := champ5 has champ5Spell1Name but champ5Spell2Name in champ5Spell2ConvertedToMinLeft
    Send, {enter}
    Sleep 100
	Send, %champion5Name% has %champ5Spell2Name% in %champ5Spell2ConvertedToMinLeft%
    Sleep 100
    Send, {enter}
}

}

Else if (champ5Spell1Bool==false)
{
if(champ5Spell2bool)
{

    Send, {enter}
    Sleep 100
    Send, %champion5Name% has %champ5Spell1Name% in %champ5Spell1ConvertedToMinLeft%
    Sleep 100
    Send, {enter}    
}
Else if(champ5Spell2bool==false)
{

    Send, {enter}
    Sleep 100
    Send, %champion5Name% has %champ5Spell1Name% in %champ5Spell1ConvertedToMinLeft% and %champ5Spell2Name% in %champ5Spell2ConvertedToMinLeft% 
    Sleep 100
    Send, {enter}     
}
}
Return