#HotIf WinActive("ahk_exe code.exe")
#hotstring EndChars `t ;tab - expand snippet
#hotstring o ?

global vsc := {
	name: "Visual Stuion Code",
	startLine: '',
	copyLine: '',
	endLine: '',
}

SetCapsLockState "AlwaysOff"

; F3::{
; 	ToolTip("Hello")
; 	Sleep(5000)
; 	ToolTip()
; }

; #1::{
; 	vsc.startLine := InputBox("Start line", "Put start line", "w300 h130", '').value
; }

; #2::{
; 	vsc.endLine := InputBox("End line", "Put end line", "w300 h130", '').value
; }

#c::{
    ClipboardTemp := ClipboardAll()
    A_Clipboard := ""
    Send("^{c}")
    ClipWait(1)
    vsc.copyLine := A_Clipboard
    A_Clipboard := ClipboardTemp
}

#v::{
	Send(vsc.startLine vsc.copyLine vsc.endLine)
}

^WheelUp::{ ;; 1
	Send('^{Up}')
}
^WheelDown::{
	Send('^{Down}')
}
^+WheelUp::{ ;; 10
	Send('^+{Up}')
}
^+WheelDown::{
	Send('^+{Down}')
}
^+!WheelUp::{ ;;0.1
	Send('^+!{Up}')
}
^+!WheelDown::{
	Send('^+!{Down}')
}

XButton1::Send "!{Left}"

XButton2::Send "!{Right}"

!Enter::{
	Send "^{Up}^{Up}"
	Sleep 100
	Send "{Up}"
	Send "{Enter}"
	Send "^{Down}^{Down}"
}

!+Left::{
	Send "{Left 20}"
	Send "{Backspace}"
}

!+Right::{
	Send "{Right 20}"
	Send "{Backspace}"
}

F1::{
	Send "{F1}"
	Send "{Enter}"
}
