#HotIf WinActive("ahk_exe Telegram.exe")

global tg := {
	name: "Telegram",
	imgPath: A_ScriptDir "\src\programs\Telegram\images\"
}

F1:: {
	Send("{RButton}")
	imageFile := "edit.png"

	isClicked := Img.findAndWaitAndClick(tg.imgPath imageFile)

	if (isClicked) {
		Send("{Enter}")
	} else {
		Msg "Can't find image " imageFile
		return
	}
	Msg ("Edit")
}

F2:: {
	Send("{RButton}")
	imageFile := "reply.png"

	isClicked := Img.findAndWaitAndClick(tg.imgPath imageFile)

	if (isClicked) {
		Send("{Enter}")
	} else {
		Say("Can't find image " imageFile)
		return
	}
	Msg("Reply")
}

F3:: {
	Send("{RButton}")
	imageFile := "save-as.png"

	isClicked := Img.findAndWaitAndClick(tg.imgPath imageFile)

	if (isClicked) {
		Send "{Enter}"
	} else {
		Say "Can't find image " imageFile
		return
	}
	Msg ("Save As")
}

F4:: {
	Send("{RButton}")
	imageFile := "save-as.png"

	isClicked := Img.findAndWaitAndClick(tg.imgPath imageFile)

	if (isClicked) {
		Send "{Enter}"
		Sleep 500
		Send "{Enter}"
		sleep 500
		Send "{Right}"
	} else {
		Say "Can't find image " imageFile
		return
	}
	Msg ("Save As")
}

~MButton:: {
	if MultiTap("MButton") = 2 {
		Send('^f')
	} else {
		Send('{Esc}')
		Send('^f')
	}
}
