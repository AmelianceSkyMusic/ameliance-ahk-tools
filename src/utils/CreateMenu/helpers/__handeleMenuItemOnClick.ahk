__handeleMenuItemOnClick(menuItem, shortcutsFolderPath, *) {
	if (menuItem.Has('action')) {
		itemAction := menuItem['action']
		if (itemAction.Has('type')) {
			itemType := itemAction['type']

			; If fnc != "" && arg != ""{
			; 	Msg "run function: " fnc '("' arg '")'
			; 	if Type(%fnc%) = "Func"
			; 		%fnc%(arg)
			; 	else
			; 		Say(fnc " is not a function",,,,,"ERR")
			; }


			if (itemType = 'link') {

				if (itemAction.Has('window') && WinExist(itemAction['window'])) {  ; activate window by title
					WinActivate(itemAction['window'])
					Msg 'activate by win name: ' itemAction['window']

				} else if (itemAction.Has('exe') && itemAction['exe'] != '' && WinExist('ahk_exe ' itemAction['exe'] '.exe')) { ; activate window by exe
					WinActivate('ahk_exe ' itemAction['exe'] '.exe')
					Msg('activate by exe: ' itemAction['exe'])

				} else if (Trim(menuItem['title']) != '' && WinExist(menuItem['title'])) {
					WinActivate(menuItem['title'])
					Msg 'activate by title: ' menuItem['title']

				} else { ; run app with using shortcut
					Msg ('run: ' menuItem['title'] '.lnk')
					Try {
						Run shortcutsFolderPath menuItem['title'] '.lnk'
					} catch as e {
						Say("Can't find: " menuItem['title'], 2 ,,,,'ERR')
					}

				}

			} else if (itemType = 'open') {
				Msg('Open: ' itemAction['run'])
				Run itemAction['run']
			}
		}
	}
}
