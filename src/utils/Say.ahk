Say(text := "Say", time := 1, x := 0, y := 0, title :='ToolTipGUI', state := "NORMAL") {
	oldWindowActive := WinGetID(,,"A")
	Switch state {
		Case "NORMAL": color := "27AE60" ;-- green
		Case "ERROR": color :="AE3030"
		Case "WARNING": color :="BD832B"
	}

	winTitle := WinGetTitle(,,"A")

	ToolTipGUI := Gui("+LastFound +AlwaysOnTop +ToolWindow -Caption", title)

	ToolTipGUI.SetFont("cWhite s14 q5 w700", "Segoe UI Bold") ; Preferred font.
	ToolTipGUI.Add("Text", "", text)
	ToolTipGUI.BackColor := color ;-- green

	winHeight := A_ScreenHeight-A_ScreenHeight/5
	ToolTipGUI.Show("xCenter y" winHeight)
	WinGetPos(&winX, &winY, &winWidth, &winHeight, title)
	WinSetRegion("0-0 w" winWidth " h" winHeight " r24-24", title)

	destroyToolTipGUI(ToolTipGUI) {
		ToolTipGUI.Destroy
		WinActivate("ahk_id" oldWindowActive)
	}
	SetTimer (*) => destroyToolTipGUI(ToolTipGUI), time * -1000
	WinExist(,,"A")
	WinActivate(,,winTitle)
}
