/*
 These AutoHotkey script assists with Putty and COBOL programming.
 Mostly simple stuff like mouse scrolling, shortcuts for vim 
 save, exit, undo, replace, search, and back search functions.
*/

#persistent

forceVim := 0

ColorCheck(){
	WinGetPos, , , Width, Height, A
	CX := Width / 2
	CY := Height - 40
	PixelGetColor, gColor, %CX%, %CY%
	return %gColor%
}

RemoveToolTip:
	ToolTip
return

$!?::
	WinGetClass, Var ,A
	;MsgBox ahk_class %Var% 
	;ColorCheck()
return

#if Not WinActive("ahk_class vwr::CDesktopWin")
$^!r::	
	Reload
return
#If

#If WinActive("ahk_class PuTTY")

$^'::
	SendInput {Ctrl down}{Backspace}
	SendInput clear{Enter}
return

$^`::
	SendInput {Ctrl down}{Backspace}
	SendInput clear{Enter}
return

$^x::
	SendInput {Ctrl down}{Backspace}
	SendInput exit{Enter}
return

!v::
	if (forceVim = 1){
		forceVim := 0
		ToolTip, Vim disabled
		SetTimer, RemoveToolTip, -1000
	}else{
		forceVim := 1		
		ToolTip, Vim enabled
		SetTimer, RemoveToolTip, -1000
	}
return

$^WheelDown::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
		SendInput {Down}
	}
return

$^WheelUp::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
		SendInput {Up}
	}
return

~WheelDown::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
		SendInput {Down 3}
	}else{
		SendInput {Down}
	}
return

~WheelUp::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
		SendInput {Up 3}
	}else{
		SendInput {Up}
	}
return

$+WheelDown::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
		SendInput {PgDn}
	}
return

$+WheelUp::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
		SendInput {PgUp}
	}
return

^f::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
		SendInput {Esc 2}
		SendInput /
	}else{
		SendRaw find . -name "*" -exec grep -il "" `{`} \; -print | sort -u
		SendInput {Left 24}
	}
return

^-::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
		SendInput {Esc 2}
		SendInput {Ctrl down}w{Ctrl up}
		SendInput s
	}
return

^Up::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
		SendInput {Esc 2}
		SendInput {Ctrl down}w{Ctrl up}
		SendInput {Up}
	}
return

^Down::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
		SendInput {Esc 2}
		SendInput {Ctrl down}w{Ctrl up}
		SendInput {Down}
	}
return

^1::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
		SendInput {Esc 2}
		SendInput :1{Enter}
	}
return

^p::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
	
	}else{
		SendInput {Esc 2}
		SendInput ps `-u 321{Enter}
	}
return

$F3::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
		SendInput {Esc 2}
		SendInput /{Enter}
	}
return

$+F3::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
		SendInput {Esc 2}
		SendInput ?{Enter}
	}
return

$^s::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
		SendInput {Esc 2}
		SendInput :w{Enter}
	}
return

$^z::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
		SendInput {Esc 2}
		SendInput u{Enter}
	}
return

$^r::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
		SendInput {Esc 2}
		SendInput :`%s{#}
	}
return

$^q::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
		SendInput {Esc 2}
		SendInput :q{!}{Enter}
	}
return

$^w::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
		SendInput {Esc 2}
		SendInput :wq{Enter}
	}
return

$^n::
	if (ColorCheck() = "0xBBBBBB" or forceVim = 1){
		SendInput {Esc 2}
		SendInput :n{Enter}
	}
return

#If