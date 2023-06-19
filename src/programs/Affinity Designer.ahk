#HotIf WinActive("ahk_exe Designer.exe")

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
;Colour inactive element of shape ASM
RButton:: {
	Send "x"
	Send "{LButton down}{LButton up}"
	Send "x"
}

;Duplicate
~LButton & RButton:: {
	Send "{Ctrl down}"
	KeyWait "LButton"
	Send "{Ctrl up}"
}

#t:: {
	MouseGetPos(&xpos, &ypos)
	countInput := InputBox("How many Items did you select?", "Items count", "w48 h112")
	if countInput.Result = "Cancel" {
		return
	}
	newValueInput := InputBox("Set your value?", "New value", "w48 h112")
		if newValueInput.Result = "Cancel" {
		return
	}

	count := countInput.value
	newValue := newValueInput.value

	loop count {
		Msg(count-A_Index)
		MouseClick "left", xpos, ypos
		sleep 300
		SendInput newValue
		Send "{Enter}"
		Send "^!]"
		sleep 100
	}
}
