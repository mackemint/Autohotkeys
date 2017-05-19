;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; OSX style keys;
; 
; https://autohotkey.com/docs/Hotkeys.htm
; 
; # = Win
; ! = Alt
; ^ = Ctrl
; + = Shift
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Command-backspace deletes whole line
<#BS::Send {LShift down}{Home}{LShift Up}{Del}

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

<#+tab:: 	;;Works, but needs to press twice for normal behavior
Send {alt down}{tab down} 
KeyWait, LWin 
Send {alt up} 
return 

Lwin & Tab::AltTab 		 	;;Works but overrides shiftalttab

;!# & Tab::ShiftAltTab 	;;Not compatible with AltTab

;;LAlt & Tab::ShiftAltTab
;;LWin & +Shift::ShiftAltTab
;;+LWin & Shift::ShiftAltTab
;;<(#+)tab::ShiftAltTab
;;LWin & LShift & Tab::ShiftAltTab
;;(LWin & Shift) & Tab::ShiftAltTab

;LWin & Tab:: 

;if GetKeyState("Shift", "P")
;	Send {ShiftAltTab}
;else
;	Send {AltTab}

;Return 



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


;The following section replaces Ctrl+Key with  Win+Key
<#a::Send ^a
<#b::Send ^b
<#c::Send ^c
<#d::Send ^d 
;<#e::Send ^e ;Open explorer is handy
;following won't remap using the normal method
<#f::Send ^f
<#g::Send ^g
<#h::Send Send ^h
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
<#8::Send ^8
<#9::Send ^9

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