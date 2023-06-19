; TODO: update to global object with collection of apps

fullscreen_is := false

#f:: ; Win+F  - fullscreen
{
	global fullscreen_is
	if fullscreen_is = false {

		global handle := DllCall("GetMenu", "Ptr", WinActive("A"))
		DllCall("SetMenu", "Ptr", WinActive("A"), "Ptr", 0)

		WinSetStyle "-0xC00000", "A"

		fullscreen_is := true

		return
	} else {
		DllCall("SetMenu", "Ptr", WinActive("A"), "Ptr", handle)

		WinSetStyle "+0xC00000", "A"

		fullscreen_is := false

		return
	}
}
