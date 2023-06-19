#HotIf WinActive("ahk_exe illustrator.exe")

#include +aiScriptsPanel.ahk
global ai := {
;   aiscripts: AiScriptsPanel("C:\Program Files\Adobe\Adobe Illustrator 2020\Presets\en_US\Scripts")
}

;hotkey to open/close the panel
F1::ai.aiscripts.Toggle()

;-------------------------------------------------------------------------------
;Move object in more distance
+^UP::{ ;Shift+Ctrl+UP
	Loop 10
	Send "+{UP}"
}

+^RIGHT::{ ;Shift+Ctrl+RIGHT
	Loop 10
	Send "+{RIGHT}"
}

+^DOWN::{ ;Shift+Ctrl+DOWN
    Loop 10
    Send "+{DOWN}"
}

+^LEFT::{ ;Shift+Ctrl+LEFT
    Loop 10
    Send "+{LEFT}"
}

;-------------------------------------------------------------------------------
!LButton:: {
	Send "x"
	Send "{LButton down}{LButton up}"
	Send "x"
}

; Duplicate
~LButton & RButton:: {
	Send "{Alt down}"
	KeyWait "LButton"
	Send "{Alt up}"
}

;Del ASM
~RButton & LButton:: {
    Send "{Delete}"
}

;Align Horizontal ASM
!c:: {
   Send "{F3}"
}

;Align Vertical ASM
!e:: {
   Send "{F4}"
}

;Align Left ASM
!a:: {
   Send "{F5}"
}

;Align Right ASM
!d:: {
   Send "{F6}"
}


;Align Top ASM
!w:: {
   Send "{F7}"
}


;Align Button ASM
!s:: {
    Send "{F8}"
}

#vk51:: {
	win_text := WinGetText("Adobe Illustrator 2019")
	If InStr(win_text, "character") {
		MsgBox "Ouyeah"
	} else {
		MsgBox "no"
	}
	MsgBox  win_text
}
