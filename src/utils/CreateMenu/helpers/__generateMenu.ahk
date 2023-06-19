#include __handeleMenuItemOnClick.ahk

__generateMenu(menuFolderpath, menuItemData) {

	tab := '`t&'
	iconFolderPath := menuFolderpath 'icons\'
	shortcutsFolderPath := menuFolderpath 'shortcuts\'

	newMenu := Menu()

	Loop(menuItemData.Length) {

		menuItem := menuItemData[A_Index]

		if (menuItem.Has('hidden') && menuItem['hidden']) {
			continue
		}

		if (menuItem.Has('divider') && menuItem['divider']) {
			newMenu.Add()
			continue
		}

		key := ''
		if (menuItem.Has('key')) {
			key := tab menuItem['key']
		}

		options := ''
		if (menuItem.Has('barBreak')) {
			options := '+BarBreak'
		}

		if (menuItem.Has('subMenu')) {
			subMenu := __generateMenu(menuFolderpath, menuItem['subMenu'])
			if (menuItem.Has('title')) {
				menuTitle := ' '
				if (menuItem['title'] != '') {
					menuTitle := menuItem['title']
				}
				newMenu.Add(menuTitle key, subMenu, options)
			} else {
				newMenu.Add(' ' key, subMenu, options)
			}
		} else if (menuItem.Has('title')) {
			menuTitle := ' '
			if (menuItem['title'] != '') {
				menuTitle := menuItem['title']
			}
			newMenu.Add(menuTitle key, ((menuItem, shortcutsFolderPath, *) => __handeleMenuItemOnClick(menuItem, shortcutsFolderPath)).bind(menuItem, shortcutsFolderPath), options)
		}

		if (menuItem.Has('icon') && menuItem['icon'] = 'link') {
			Try {
				FileGetShortcut(shortcutsFolderPath menuItem['title'] '.lnk', &OutTarget, &OutDir, &OutArgs, &OutDesc, &OutIcon, &OutIconNum, &OutRunState)
				newMenu.SetIcon(menuItem['title'] key, OutTarget, -1, 16)
			} catch Error {
				; MsgBox('Item '' menuItem['title'] '' ' 'don't have icon file or shortcut', , 16)
			}
		} else if (menuItem.Has('icon') && menuItem['icon'] != 'link') {
			newMenu.SetIcon(menuItem['title'] key, iconFolderPath menuItem['icon'] , , 0)
		}

		if (menuItem.Has('disabled')) {
			newMenu.Disable(menuItem['title'] key)
		}

	}
	return newMenu
}
