#HotIf (WinActive("ahk_exe Figma.exe") or WinActive("ahk_exe Figma Beta.exe")) and not WinActive("ahk_class #32770")

global figma := {
	name: "Figma",
	interfaceScale: "x100",
	imgPath: "",
	isMouseOnWorkArea: __isMouseOnWorkArea,
	isMouseOnLeftArea: __isMouseOnLeftArea,
	isMouseOnRightArea: __isMouseOnRightArea
}

imgPath := A_ScriptDir "\src\programs\Figma\images\" figma.interfaceScale "\"


__isMouseOnWorkArea(this) {
	MouseGetPos(&MouseX, &MouseY)
	mouseOnWorkArea := (MouseX > 240 && MouseX < 1127) && (MouseY > 77 && MouseY < 767)
	return mouseOnWorkArea
}

__isMouseOnLeftArea(this) {
	MouseGetPos(&MouseX, &MouseY)
	mouseOnWorkArea := (MouseX < 240) && (MouseY > 77 && MouseY < 767)
	return mouseOnWorkArea
}

__isMouseOnRightArea(this) {
	MouseGetPos(&MouseX, &MouseY)
	mouseOnWorkArea := (MouseX > 1127) && (MouseY > 77 && MouseY < 767)
	return mouseOnWorkArea
}


;-------------------------------------------------------------------------------
;---------------------------------- HOTKEYS ------------------------------------
;-------------------------------------------------------------------------------
;flip horizontal
+!c::Send "+{h}"

;flip vertical
+!e::Send "+{v}"

;show hide layers
F1::Send "^+{\}"

;show hide layers
^!Numpad0::Send "^+{e}"

;-------------------------------------------------------------------------------
;Middle Mouse Button activates hand tool dragging.
MButton:: {
	Send "{Space down}"
	Sleep 100
	Send "{LButton down}"
	KeyWait "MButton"
	Send "{LButton up}{Space up}"
}

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
;------------------------------- CUSTOM ACTION ---------------------------------
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
;Move object in more distance
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
	Send "{Alt down}"
	KeyWait "LButton"
	Send "{Alt up}"
}

;Del
~RButton & LButton:: {
	Send "{Delete}"
}

;Align Horizontal
!c::Send "!{vk48}"

;Align Vertical
!e::Send "!{vk56}"


#HotIf (WinActive("ahk_exe Figma.exe") or WinActive("ahk_exe Figma Beta.exe")) and not WinActive("ahk_class #32770") and figma.isMouseOnWorkArea()
;-------------------------------------------------------------------------------
;Zoom in - Switches Ctrl+Wheelup with Wheelup
$Wheelup:: {
	Send "{Ctrl down}"
	Send "{Wheelup}"
	Send "{Wheelup}"
	Send "{Ctrl up}"
	return
}

;Zoom out - Switches Ctrl+Wheeldown with Wheeldown
$Wheeldown:: {
	Send "{Ctrl down}"
	Send "{Wheeldown}"
	Send "{Wheeldown}"
	Send "{Ctrl up}"
}
