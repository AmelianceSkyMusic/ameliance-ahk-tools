#HotIf WinActive("ahk_exe Reaper.exe") and not WinActive("ahk_class #32770")

global reaper := {
	name: "Reaper",
	xOffset: 0,
	yOffset: -55
}
;;;;; Вообще идет привязка к окну, но можно сделать что бы привязывалось к началу плагина? Я как-то это делал раньше в телеграме

#Enter::{
	try {
		loop 10 {
			WinActivate("About REAPER")
			Sleep 1000
		}
	} catch Error as err {
		Msg("Window not found")
	}
}
