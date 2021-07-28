;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MacOS style keys;
;
; https://autohotkey.com/docs/Hotkeys.htm
;
; # = Win
; ! = Alt
; ^ = Ctrl
; + = Shift
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;#InstallKeybdHook

;Command-backspace deletes whole line
<#BS::Send {LShift down}{Home}{LShift Up}{Del}

;Can't map Fn button, so RWin-backspace sends Delete
>#BS::Send {Del}

;alt-delete deletes previous word
!BS::Send {LCtrl down}{Backspace}{Lctrl up}

; Navigation of smaller chunks (skip word)
!Left::Send {ctrl down}{Left}{ctrl up}
!Right::Send {ctrl down}{Right}{ctrl up}


; Navigation using of bigger chunks (Skip to start/end of line/paragraph/document)
#Left::Send {Home}
#Right::Send {End}
!Up::Send {ctrl down}{Up}{ctrl up}
!Down::Send {ctrl down}{Down}{ctrl up}
#Up::Send {Lctrl down}{Home}{Lctrl up}
#Down::Send {Lctrl down}{End}{Lctrl up}

; Assign ctrl+arrows to move windows instead
^Left::Send {LWin down}{Left}{LWin up} 
^Right::Send {LWin down}{Right}{LWin up} 
^Up::Send {LWin down}{Up}{LWin up} 
^Down::Send {LWin down}{Down}{LWin up} 


; Assign ctrl+shift+arrows to move between windows instead
^+Left::Send {LWin down}{Shift down}{Left}{Shift up}{LWin up} 
^+Right::Send {LWin down}{Shift down}{Right}{Shift up}{LWin up} 
^+Up::Send {LWin down}{Shift down}{Up}{Shift up}{LWin up} 
^+Down::Send {LWin down}{Shift down}{Down}{Shift up}{LWin up} 

<#Enter::Send ^{Enter}

;;alt+shift+tab
<#+tab::
	Send {alt down}{shift down}{tab down} 
	KeyWait, LWin 
	Send {alt up}{shift up} 
return
;;alt+tab
<#tab::
	Send {alt down}{tab down} 
	KeyWait, LWin 
	Send {alt up} 
return 

;Alt 2 = @
<!2::send @
;Alt § = <
<!sc029::send <
;Alt shift § = >
<!+sc029::send >

; Selection (uses a combination of the above with shift)
<!+Left::Send {ctrl down}{shift down}{Left}{shift up}{ctrl up}
<!+Right::Send {ctrl down}{shift down}{Right}{shift up}{ctrl up}
#+Left::Send {shift down}{Home}{shift up}
#+Right::Send {shift down}{End}{shift up}
!+Up::Send {ctrl down}{shift down}{Up}{shift up}{ctrl up}
!+Down::Send {ctrl down}{shift down}{Down}{shift up}{ctrl up}
#+Up::Send {Lctrl down}{shift down}{Home}{shift up}{Lctrl up}
#+Down::Send {Lctrl down}{shift down}{End}{shift up}{Lctrl up}


;Closing windows and programs (using the Win Key)
<#q::Send !{F4}
<#w::Send ^w

; GetKeyState, state, LWin
; 	if GetKeyState("Space")
; 		Send {LWin}
; 	if state="U"
; 		Return
; 	while(GetKeyState("LWinDown"))
; 	{
; 		if GetKeyState("LButton")
; 			Send ^{Click}
; 			Return
; 		if GetKeyState("WheelUp")
; 			Send {WheelUp}
; 			Return
; 		if GetKeyState("WheelDown")
; 			Send {WheelDown}
; 			Return
; 		if GetKeyState("LWinUp")
; 			Break
; 	}
; Return

;Remaps ctrl+mouse events to win+mouse events
<#LButton::Send ^{MouseClick} ;Ctrl+LeftClick
<#WheelUp::Send ^{WheelUp} ;TODO Ctrl-Zoom
<#WheelDown::Send ^{WheelDown} ;TODO Ctrl-Zoom

; Disable Win-key -search and introduce Spotlight-like behavior of CMD + Space
<#Space::Send {LWin} ; TODO requires pressing space multiple times in Win10
LWin::return ; Disable win-key only

<#a::Send ^a
<#b::Send ^b
#IfWinActive ahk_exe WindowsTerminal.exe
	<#c::Send ^+c ;Copy in Git Bash
#IfWinActive
	<#c::Send ^c

<#d::Send ^d 
<#+d::Send ^+d 
;<#e::Send ^e ;Open explorer is handy
<#f::Send ^f
<#g::Send ^g
<#h::Send ^h
<#i::Send ^i
<#j::Send ^j
<#k::Send ^k
;<#l::Send Send {LCtrl down}{l}{LCtrl up} ;disabled, I like winkey-L
<#m::WinMinimize,a
<#n::Send ^n
<#+n::Send ^+n ;New folder
<#o::Send ^o
<#p::Send ^p

<#r::Send ^r 
<#s::Send ^s
<#+s::Send ^+s ;Save as
<#t::Send ^t
<#+t::Send ^+t ;Undoes closing tab in Chrome, Firefox
<#u::Send ^u
#IfWinActive ahk_exe WindowsTerminal.exe
	<#v::Send ^+v ;Paste in Git Bash
#IfWinActive
	<#v::Send ^v

<#x::Send ^x
<#+z::Send ^y
<#z::Send ^z
<#1::Send ^1
<#2::Send ^2
<#3::Send ^3
<#4::Send ^4
<#5::Send ^5
<#6::Send ^6
<#7::Send ^7
!7::Send |		; alt+7 for "pipe" character 
RAlt & 7::Send |		; right alt+7 for "pipe" character 
+!7::Send \ 		; alt+shift+7 for "backslash" character 
<#8::Send ^8
!8::Send {{} ;For { use the following combination: [Alt] + [(] 
!9::Send {}}	;For } use the following combination: [Alt] + [)]   
!+8::Send [	;For [ use the following combination: [Alt] + [Shift] + [(] 
!+9::Send ]	;For ] use the following combination: [Alt] + [Shift] + [)]   
<#9::Send ^9
<#'::Send ^'

;;Transport controls, as placed on Apple keyboard  
F7:: Send {Media_Prev}
F8:: Send {Media_Play_Pause}
F9:: Send {Media_Next}

F10::Send {Volume_Mute}
F11::Send {Volume_Down}
F12::Send {Volume_Up}

;;Thanks to wasserja and Mr Automaton: https://github.com/wasserja/AutoHotKeyScripts/blob/master/snipit.ahk
<#+4::
If WinExist("Snipping Tool")
{
	WinActivate
	WinWaitActive
	Send !n
	Send r
}
else
{
	Run, %windir%\System32\SnippingTool.exe
	WinWait, ahk_class Microsoft-Windows-Tablet-SnipperToolbar
	WinActivate, ahk_class Microsoft-Windows-Tablet-SnipperToolbar
	WinWaitActive, ahk_class Microsoft-Windows-Tablet-SnipperToolbar
	Send !n
	Send r
}
return


