#HotIf GetKeyState("Capslock", "T") and WinActive("ahk_exe Adobe Premiere Pro.exe")

vkBC::Send("+i") ; ,
vkBE::Send("+o") ; .
!vkBC::Send("{Top}") ; ,
!vkBE::Send("+o") ; .

Space::Send("+k") ; .!!!Play Around
~^Space::Send("{Space}") ; ,

^LButton::Send("^+!pc{LButton}{Sleep 200}v") ; -- cut
^+LButton::Send("^+!pc+{LButton}{Sleep 200}v") ; -- cut
^RButton::Send("^+!p") ; -- !!!Move Playhead to Cursor
^#LButton::Send("^+!pq") ; --
!#LButton::Send("^+!pw") ; --

#LButton::Send("{LButton}{Sleep 100}{Delete}")

;Duplicate
~LButton & RButton:: {
	Send "{LButton Up}"
	Send "{Alt down}"
	Send "{LButton Down}"
	KeyWait "LButton"
	Send "{Alt up}"
}

;Del ASM
~RButton & LButton:: {
	Send "{Delete}"
}

MButton:: {
	Send "h{LButton down}"
	KeyWait "MButton"
	Send "{LButton up}v"
}

;Switches Alt+Wheelup with Wheelup
Wheelup:: {
	Send "{Alt down}"
	Send "{Wheelup}"
	Send "{Wheelup}"
	Send "{Alt up}"
}

;Switches Alt+Wheeldown with Wheeldown
Wheeldown:: {
	Send "{Alt down}"
	Send "{Wheeldown}"
	Send "{Wheeldown}"
	Send "{Alt up}"
}
