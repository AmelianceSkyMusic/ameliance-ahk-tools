#HotIf WinActive("ahk_exe notepad.exe")
F1:: msgbox MultiTap("F1")

F2:: {
	switch Abs(l := MultiTap("F2")) {
		case 1: r := "1"
		case 2: r := "2"
		case 3: r := "3"
		case 4: r := "4"
		default: r := "long"
	}
	msgbox l < 0 ? "long " r : r
}

RButton:: {
	Run "ahk_exe " "code" ".exe"
}
