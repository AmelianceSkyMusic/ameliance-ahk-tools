#HotIf WinActive("ahk_exe chrome.exe") HotIfWinNotActive("ahk_exe code.exe") HotIfWinNotActive("ahk_exe clover.exe")
;-------------------------------------------------------------------------------

_CHROME := {
	name: "Chrome",
	isTabbarShow: true,
	isMouseOnAdressBar: _isMouseOnAdressBar,
}

_isMouseOnAdressBar(this) {
	MouseGetPos(&MouseX, &MouseY)
	MouseOnAdressBar := (MouseX > 0 and MouseX < 1366) and (MouseY > 35 and MouseY < 70)
	return MouseOnAdressBar
}

;-------------------------------------------------------------------------------
~MButton:: { ;show hide tab bar
	If _CHROME.isMouseOnAdressBar() {
		Send("^+b")
	}
}
