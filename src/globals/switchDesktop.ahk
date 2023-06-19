#HotIf
#WheelDown::Send('{Blind}^#{RIGHT}') sleep(150)
#WheelUp::Send('{Blind}^#{LEFT}') sleep(150)
#Mbutton::Send('{Blind}#{TAB}')

#HotIf isMouse.onTop() || isMouse.onTopOfSecondMonitor()

WheelDown::{
	Send('{Blind}^#{RIGHT}')
	Msg("→", , ,0 ,"STATIC")
	sleep(150)
}

WheelUp::{
	Send('{Blind}^#{LEFT}')
	Msg("←", , ,0 ,"STATIC")
	sleep(150)
}
