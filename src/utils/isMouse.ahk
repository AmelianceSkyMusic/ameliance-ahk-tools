isMouse := {
	onTop: _onTop,
	onBottom: _onBottom,
	onRightEdge: _onRightEdge,
	onTopOfSecondMonitor: _onTopOfSecondMonitor,
}

_onTop(this) {
	CoordMode "Mouse", "Screen"
	MouseGetPos(&MouseX, &MouseY)
	MouseOnBottom := (MouseY >= SCREENS.yStart and MouseY <= SCREENS.yStart+5)
	return MouseOnBottom
}

_onBottom(this) {
	CoordMode "Mouse", "Screen"
	MouseGetPos(&MouseX, &MouseY)
	MouseOnTop := (MouseX >= SCREENS.xStart and MouseX <= SCREENS.yEnd)
		and (MouseY >= SCREENS.yEnd-10 and MouseY <= SCREENS.yEnd)
	return MouseOnTop
}

_onRightEdge(this) {
	CoordMode "Mouse", "Screen"
	MouseGetPos(&MouseX, &MouseY)
	MouseOnRightEdge := (MouseX >= SCREENS.xEnd-1 and MouseX <= SCREENS.xEnd)
		and (MouseY >= SCREENS.yStart and MouseY <= SCREENS.yEnd)
	return MouseOnRightEdge
}

_onTopOfSecondMonitor(this) {
	MonitorGet 2, &LEFT, &TOP, &RIGHT, &BOTTOM
	CoordMode "Mouse", "Screen"
	MouseGetPos(&MouseX, &MouseY)
	MouseOnBottom := (MouseY >= TOP and MouseY <= TOP+5)
	return MouseOnBottom
}
