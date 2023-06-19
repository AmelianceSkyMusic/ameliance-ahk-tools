#HotIf WinActive("ahk_exe photoshop.exe")

;-------------------------------------------------------------------------------
;Middle Mouse Button activates hand tool dragging.
MButton:: {
	Send "{Space down}{LButton down}"
	KeyWait "MButton"
	Send "{LButton up}{Space up}"
}

;-------------------------------------------------------------------------------
;----- Move object in more distance
+^UP:: { ;Shift+Ctrl+UP
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

;Align Left ASM
!a:: {
	Send "^+{F5}"
}

;Align Right ASM
!d:: {
	Send "^+{F6}"
}

;Align Top ASM
!w:: {
	Send "^+{F7}"
}

;Align Button ASM
!s:: {
	Send "^+{F8}"
}

;Align Horizontal ASM
!c:: {
	Send "^+{F3}"
}

;Align Vertical ASM
!e:: {
	Send "^+{F4}"
}
