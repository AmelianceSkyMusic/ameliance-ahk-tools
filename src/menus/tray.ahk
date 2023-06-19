APP.mouseClickSoundState := false

tray := A_TrayMenu ; For convenience.
tray.delete ; Delete the standard items.
tray.add("Click Sound", mouseClickSound)
tray.add
tray.add
tray.add
tray.addStandard



mouseClickSound(*) {
	APP.mouseClickSoundState := !APP.mouseClickSoundState
	tray.ToggleCheck "Click Sound"
}
