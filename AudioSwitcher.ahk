; set language
; en = "&Set Default"
; de = "&Als Standard"
asDefault := "&Als Standard"

; set shortcut
; ^ = CTRL / STRG
; # = WIN
; ! = ALT
; + = SHIFT / Umschalt
^+f12::

; Script
Run, mmsys.cpl
WinWait,Sound

ControlSend,SysListView321,{PgUp}
ControlGet, asDefaultIsClickable, Enabled,,%asDefault%
position := 1

while (asDefaultIsClickable) {
   ControlSend,SysListView321,{Down}  
   ControlGet, asDefaultIsClickable, Enabled,,%asDefault%
   position := position+1
}

ControlGet, max, List, Count, SysListView321

if(position < max){
	ControlSend,SysListView321,{Down}
} else {
	ControlSend,SysListView321,{PgUp}
}

ControlClick,%asDefault%
ControlClick,OK
WinWaitClose
; if you want to play a sound after the switch
; SoundPlay, *-1
return