#HotIf WinActive("ahk_exe InDesign.exe")

;-------------------------------------------------------------------------------
;Switches Alt+Wheelup with Wheelup
Wheelup:: {
	Send "{Alt down}"
	Send "{Wheelup}"
	Send "{Alt up}"
}


;Switches Alt+Wheeldown with Wheeldown
Wheeldown:: {
	Send "{Alt down}"
	Send "{Wheeldown}"
	Send "{Alt up}"
}

;-------------------------------------------------------------------------------
;Middle Mouse Button activates hand tool dragging.
MButton:: {
	Send "{Space down}{LButton down}"
	KeyWait "MButton"
	Send "{LButton up}{Space up}"
}

;-------------------------------------------------------------------------------
;----- Move object in more distance
+^UP:: { ;--Shift+Ctrl+UP
	Loop 10
	Send "+{UP}"
}

+^RIGHT:: { ;Shift+Ctrl+RIGHT
	Loop 10
	Send "+{RIGHT}"
}

+^DOWN:: { ;Shift+Ctrl+DOWN
	Loop 10
	Send "+{DOWN}"
}

+^LEFT:: { ;Shift+Ctrl+LEFT
	Loop 10
	Send "+{LEFT}"
}

;-------------------------------------------------------------------------------
;Colour inactive element of shape ASM
RButton:: {
	Send "x"
	Sleep 500
	Send "{LButton down}{LButton up}"
	Send "x"
}

;Duplicate
~LButton & RButton:: {
	Send "{Alt down}"
	KeyWait "LButton"
	Send "{Alt up}"
}

;Del ASM
~RButton & LButton:: {
	Send "{Delete}"
}
