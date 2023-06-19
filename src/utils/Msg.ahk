Msg(text, time := 1000, x := unset, y := unset, type := "DYNAMIC") {
	CoordMode "ToolTip", "Screen"

	if (type = "STATIC") {
		ToolTip(text, x ?? unset, y ?? unset)
		SetTimer(Tooltip, time * -1)
		return
	}

	__showUpdatedTooltop() {
		ToolTip(text, x ?? unset, y ?? unset)
	}

	SetTimer(__showUpdatedTooltop, 1)
	Sleep(time)
	SetTimer(__showUpdatedTooltop, 0)
	Tooltip()

	; progress := 0
	; while (progress <= time) {
	; 	ToolTip(text, x ?? unset, y ?? unset)
	; 	Sleep(1)
	; 	progress += (1000 / 60)
	; }
	; Tooltip()

	; loop (1000 / 10) {
	; 	ToolTip(text, x ?? unset, y ?? unset)
	; 	Sleep 1
	; }
	; Tooltip()
}
