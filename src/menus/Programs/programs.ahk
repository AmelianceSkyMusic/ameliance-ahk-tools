
~LShift:: {
   if Multitap("LShift") = 2 {
      menu := CreateMenu('src\menus\Programs\')
		menu.Show()
		PostMessage(0x0050, 0, 0x4090409, , "A")
	}
}
