#HotIf

~LButton::{
	if APP.mouseClickSoundState != false {
		SoundPlay(A_ScriptDir "\src\assets\mp3\left_mouse_click.mp3", -1000)
	}
}

~RButton::{
	if APP.mouseClickSoundState != false {
		SoundPlay(A_ScriptDir "\src\assets\mp3\right_mouse_click.mp3", -1000)
	}
}

~MButton::{
	if APP.mouseClickSoundState != false {
		SoundPlay(A_ScriptDir "\src\assets\mp3\mouse_click.mp3", -1000)
	}
}

#HotIf WinActive("ahk_exe explorer.exe")
XButton1::Send "!{UP}"

#HotIf WinActive("ahk_exe TOTALCMD64.exe")
XButton1::Send "{BACKSPACE}"

#HotIf WinActive("ahk_exe doublecmd.exe")
XButton1::Send "{BACKSPACE}"

#HotIf WinActive("ahk_exe OneCommander.exe")
XButton1::Send "!{UP}"

#HotIf WinActive("ahk_class #32770")
XButton1::Send "!{UP}"

#HotIf WinActive("ahk_exe sharex.exe")
XButton1::Send "{Enter}"

#HotIf WinActive("ahk_exe Studio One.exe")
XButton1::Send "{LButton}{Del}"

#HotIf
XButton1::Send "{PrintScreen}"

XButton2::Click 2

!XButton2::
{
	Send "!{Click 2}"
}


^XButton1::Send "^C"
^XButton2::Send "^v"

+MButton::Send "+{enter}"

^MButton::Send "{enter}"

#HotIf GetKeyState("ScrollLock", "T")
{
	XButton1::Send("!{Tab}")
	XButton2::Send("+!{Tab}")
}

#HotIf WinActive("ahk_exe chrome.exe")
XButton1::{
	Send "{Click 3}"
	Sleep 200
	Send "^+h"
}

~LButton & RButton::
{
	Send "{Enter}"
}

CapsLock & ~LButton:: Send("{Blind}{Left}")
CapsLock & ~RButton:: Send("{Blind}{Right}")
CapsLock & ~WheelUp:: Send("{Blind}{Up}")
CapsLock & ~WheelDown:: Send("{Blind}{Down}")
