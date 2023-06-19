#HotIf WinActive("ahk_exe Studio One.exe")

global this_program := "Studio One"
global xo := 0
global yo := 0

global studioOne := {
	name: "Studio One",
	xOffset: 0,
	yOffset: 0
}

; ------------------------------------------------------------------------------
#vk46:: { ; Win+F — fullscreen

	if menu_toggle := !menu_toggle {
		handle := DllCall("GetMenu", "Ptr", WinActive("A"))

		DllCall("SetMenu", "Ptr", WinActive("A"), "Ptr", 0)

		WinSetStyle "-0x1c00000", "A" ; bordersline

		hMenu := handle

		WinMaximize
		return
	} else {
		DllCall("SetMenu", "Ptr", WinActive("A"), "Ptr", hMenu)
		WinSetStyle "+0x1c00000", "A" ; bordersline

		hMenu := 0

		WinRestore
		return
	}
}

;-------------------------------------------------------------------------------
;Automation fallow
#vk41:: { ; Win+A
	MouseGetPos(&start_xpos, &start_ypos)
	MouseClick "left", 70, 60, 1, 1
	Sleep 100
	WinWait "ahk_class CCLShadowDialogClass"
	MouseClick "left", 18, 195, 1, 1
	MouseClick "left", 70, 60, 1, 1
	Sleep 100
	SoundPlay "*-1, WAIT"
	MouseMove start_xpos, start_ypos, 1
	Sleep "400"
	send "{Esc}"
}


;-------------------------------------------------------------------------------
;Duplicate ASM
~LButton & RButton:: {
	Send "{Alt down}"
	KeyWait "LButton"
	Send "{Alt up}"
}

;-------------------------------------------------------------------------------
;Del ASM
~RButton & LButton:: {
	Send "{LButton}"
	Send "{Delete}"
	Send "{Esc}"
}

;-------------------------------------------------------------------------------
;Purge all samples
^vkBD:: { ; Ctrl+-
	MouseGetPos(&start_xpos, &start_ypos)
	Title := WinGetTitle("A")
	If InStr(Title, "KONTAKT"){
		MouseClick "left", 670, 100, 1, 1 ;Reset markers
		Sleep "100"
		MouseClick "left", 670, 395, 1, 1
		Sleep "100"
		Send "{Down}"
		Send "{Enter}"
		Sleep "100"
		MouseClick "left", 670 + studioOne.xOffset, 100 + studioOne.yOffset, 1, 1
		Sleep "100"
		MouseClick "left", 670 + studioOne.xOffset, 395 + studioOne.yOffset, 1, 1
		Sleep "100"
		Send "{Down}"
		Send "{Down}"
		Send "{Down}"
		Send "{Enter}"
	}
	MouseMove start_xpos, start_ypos, 1
	Sleep "400"
}

;Update sample pool
^vkBB:: { ;Ctrl+=
	MouseGetPos(&start_xpos, &start_ypos)
	Title := WinGetTitle("A")
	If InStr(Title, "KONTAKT"){

		MouseClick "left", 670 + studioOne.xOffset, 100 + studioOne.yOffset, 1, 1 ;Update sample pool
		Sleep "100"
		MouseClick "left", 670 + studioOne.xOffset, 395 + studioOne.yOffset, 1, 1
		Sleep "100"
		Send "{Down}"
		Send "{Down}"
		Send "{Enter}"
	}

	MouseMove start_xpos, start_ypos, 1
	Sleep "400"
}

;-------------------------------------------------------------------------------\
;Prev preset
vkBD:: { ;-
	MouseGetPos(&start_xpos, &start_ypos)
	Title := WinGetTitle("A")
	If InStr(Title, "Absynth")
		MouseClick "left", 410 + studioOne.xOffset, 145 + studioOne.yOffset, 1, 1
	If InStr(Title, "Addictive Drums")
		MouseClick "left", 400 + studioOne.xOffset, 110 + studioOne.yOffset, 1, 1
	If InStr(Title, "ANA2")
		MouseClick "left", 520 + studioOne.xOffset, 115 + studioOne.yOffset, 1, 1
	If InStr(Title, "Analog Lab")
		MouseClick "left", 600 + studioOne.xOffset, 95 + studioOne.yOffset, 1, 1
	If InStr(Title, "Battery")
		MouseClick "left", 685 + studioOne.xOffset, 95 + studioOne.yOffset, 1, 1
	If InStr(Title, "Diva")
		MouseClick "left", 412 + studioOne.xOffset, 110 + studioOne.yOffset, 1, 1
	If InStr(Title, "DUNE 3")
		MouseClick "left", 568 + studioOne.xOffset, 140 + studioOne.yOffset, 1, 1
	If InStr(Title, "HIVE")
		MouseClick "left", 495 + studioOne.xOffset, 110 + studioOne.yOffset, 1, 1
	If InStr(Title, "Iris")
		MouseClick "left", 455 + studioOne.xOffset, 95 + studioOne.yOffset, 1, 1
	If InStr(Title, "KONTAKT")
		MouseClick "left", 640 + studioOne.xOffset, 170 + studioOne.yOffset, 1, 1
	If InStr(Title, "Legend")
		MouseClick "left", 785 + studioOne.xOffset, 110 + studioOne.yOffset, 1, 1
	If InStr(Title, "Massive")
		MouseClick "left", 602 + studioOne.xOffset, 104 + studioOne.yOffset, 1, 1
	If InStr(Title, "Massive X")
		MouseClick "left", 665 + studioOne.xOffset, 100 + studioOne.yOffset, 1, 1
	If InStr(Title, "Pigments")
		MouseClick "left", 530 + studioOne.xOffset, 95 + studioOne.yOffset, 1, 1
	If InStr(Title, "Repro-1")
		MouseClick "left", 438 + studioOne.xOffset, 140 + studioOne.yOffset, 1, 1
	If InStr(Title, "Repro-5")
		MouseClick "left", 444 + studioOne.xOffset, 134 + studioOne.yOffset, 1, 1
	If InStr(Title, "Serum")
		MouseClick "left", 690 + studioOne.xOffset, 100 + studioOne.yOffset, 1, 1
	If InStr(Title, "Spire")
		MouseClick "left", 294 + studioOne.xOffset, 108 + studioOne.yOffset, 1, 1
	If InStr(Title, "Sylenth1")
		MouseClick "left", 612 + studioOne.xOffset, 246 + studioOne.yOffset, 1, 1
	If InStr(Title, "SynthMaster2")
		MouseClick "left", 570 + studioOne.xOffset, 90 + studioOne.yOffset, 1, 1
	If InStr(Title, "TAL Sampler")
		MouseClick "left", 555 + studioOne.xOffset, 100 + studioOne.yOffset, 1, 1
	If InStr(Title, "Avenger")
		MouseClick "left", 312 + studioOne.xOffset, 100 + studioOne.yOffset, 1, 1
	If InStr(Title, "Zebra")
		MouseClick "left", 428 + studioOne.xOffset, 108 + studioOne.yOffset, 1, 1

	If InStr(Title, "Impact")
		MouseClick "left", 84 + studioOne.xOffset, 54 + studioOne.yOffset, 1, 1
	If InStr(Title, "Mai Tai")
		MouseClick "left", 84 + studioOne.xOffset, 54 + studioOne.yOffset, 1, 1
	If InStr(Title, "Mojito")
		MouseClick "left", 84 + studioOne.xOffset, 54 + studioOne.yOffset, 1, 1
	If InStr(Title, "Presence")
		MouseClick "left", 84 + studioOne.xOffset, 54 + studioOne.yOffset, 1, 1
	If InStr(Title, "SampleOne")
		MouseClick "left", 84 + studioOne.xOffset, 54 + studioOne.yOffset, 1, 1
	If InStr(Title, "ReaScript Development Environment"){
		Send "-"
		return
		}
	MouseMove start_xpos, start_ypos, 1
	Sleep "400"
}

;Next preset
vkBB:: ; =
{
	MouseGetPos(&start_xpos, &start_ypos)
	Title := WinGetTitle("A")
	If InStr(Title, "Absynth")
		MouseClick "left", 430 + studioOne.xOffset, 145 + studioOne.yOffset, 1, 1
	If InStr(Title, "Addictive Drums")
		MouseClick "left", 400 + studioOne.xOffset, 130 + studioOne.yOffset, 1, 1
	If InStr(Title, "ANA2")
		MouseClick "left", 536 + studioOne.xOffset, 115 + studioOne.yOffset, 1, 1
	If InStr(Title, "Analog Lab")
		MouseClick "left", 630 + studioOne.xOffset, 95 + studioOne.yOffset, 1, 1
	If InStr(Title, "Battery")
		MouseClick "left", 685 + studioOne.xOffset, 105 + studioOne.yOffset, 1, 1
	If InStr(Title, "Diva")
		MouseClick "left", 666 + studioOne.xOffset, 110 + studioOne.yOffset, 1, 1
	If InStr(Title, "DUNE 3")
		MouseClick "left", 590 + studioOne.xOffset, 140 + studioOne.yOffset, 1, 1
	If InStr(Title, "HIVE")
		MouseClick "left", 765 + studioOne.xOffset, 110 + studioOne.yOffset, 1, 1
	If InStr(Title, "Iris")
		MouseClick "left", 455 + studioOne.xOffset, 105 + studioOne.yOffset, 1, 1
	If InStr(Title, "KONTAKT")
		MouseClick "left", 660 + studioOne.xOffset, 170 + studioOne.yOffset, 1, 1
	If InStr(Title, "Legend")
		MouseClick "left", 795 + studioOne.xOffset, 110 + studioOne.yOffset, 1, 1
	If InStr(Title, "Massive")
		MouseClick "left", 602 + studioOne.xOffset, 122 + studioOne.yOffset, 1, 1
	If InStr(Title, "Massive X")
		MouseClick "left", 680 + studioOne.xOffset, 100 + studioOne.yOffset, 1, 1
	If InStr(Title, "Pigments")
		MouseClick "left", 560 + studioOne.xOffset, 95 + studioOne.yOffset, 1, 1
	If InStr(Title, "Repro-1")
		MouseClick "left", 684 + studioOne.xOffset, 140 + studioOne.yOffset, 1, 1
	If InStr(Title, "Repro-5")
		MouseClick "left", 674 + studioOne.xOffset, 134 + studioOne.yOffset, 1, 1
	If InStr(Title, "Serum")
		MouseClick "left", 710 + studioOne.xOffset, 100 + studioOne.yOffset, 1, 1
	If InStr(Title, "Spire")
		MouseClick "left", 330 + studioOne.xOffset, 108 + studioOne.yOffset, 1, 1
	If InStr(Title, "Sylenth1")
		MouseClick "left", 612 + studioOne.xOffset, 256 + studioOne.yOffset, 1, 1
	If InStr(Title, "SynthMaster2")
		MouseClick "left", 590 + studioOne.xOffset, 90 + studioOne.yOffset, 1, 1
	If InStr(Title, "TAL Sampler")
		MouseClick "left", 835 + studioOne.xOffset, 100 + studioOne.yOffset, 1, 1
	If InStr(Title, "Avenger")
		MouseClick "left", 322 + studioOne.xOffset, 100 + studioOne.yOffset, 1, 1
	If InStr(Title, "Zebra")
		MouseClick "left", 722 + studioOne.xOffset, 108 + studioOne.yOffset, 1, 1
	If InStr(Title, "Impact")
		MouseClick "left", 98 + studioOne.xOffset, 54 + studioOne.yOffset, 1, 1
	If InStr(Title, "Mai Tai")
		MouseClick "left", 98 + studioOne.xOffset, 54 + studioOne.yOffset, 1, 1
	If InStr(Title, "Mojito")
		MouseClick "left", 98 + studioOne.xOffset, 54 + studioOne.yOffset, 1, 1
	If InStr(Title, "Presence")
		MouseClick "left", 98 + studioOne.xOffset, 54 + studioOne.yOffset, 1, 1
	If InStr(Title, "SampleOne")
		MouseClick "left", 98 + studioOne.xOffset, 54 + studioOne.yOffset, 1, 1
	If InStr(Title, "ReaScript Development Environment") {
		Send "="
		return
		}
	MouseMove start_xpos, start_ypos, 1
	Sleep "400"
}

;-------------------------------------------------------------------------------
; Move active of window on 10px
#UP:: {
	WinGetPos(&win_x, &win_y, &win_width, &win_height)
	WinMove win_x,  win_y-10
}

#DOWN:: {
	WinGetPos(&win_x, &win_y, &win_width, &win_height)
	WinMove win_x,  win_y+10
}

#LEFT:: {
	WinGetPos(&win_x, &win_y, &win_width, &win_height)
	WinMove win_x-10,  win_y
}

#RIGHT:: {
	WinGetPos(&win_x, &win_y, &win_width, &win_height)
	WinMove win_x+10,  win_y
}

; Change size of active window on 10px
#+UP:: {
	WinGetPos(&win_x, &win_y, &win_width, &win_height)
	WinMove win_x, win_y-50, win_width,  win_height
}
#+DOWN:: {
	WinGetPos(&win_x, &win_y, &win_width, &win_height)
	WinMove win_x, win_y+50, win_width,  win_height
}
#+LEFT:: {
	WinGetPos(&win_x, &win_y, &win_width, &win_height)
	WinMove win_x-50, win_y, win_width,  win_height
}
#+RIGHT:: {
	WinGetPos(&win_x, &win_y, &win_width, &win_height)
	WinMove win_x+50, win_y, win_width,  win_height
}

#HOME:: {
	WinGetPos(&win_x, &win_y, &win_width, &win_height)
	WinMove (A_ScreenWidth/2)-(win_width/2), (A_ScreenHeight/2)-(win_height/2)
}

; Move mouse cursore of window on 1px
^#UP:: {
	MouseGetPos(&start_xpos, &start_ypos)
	MouseMove start_xpos, start_ypos-1, 1
}

^#DOWN:: {
	MouseGetPos(&start_xpos, &start_ypos)
	MouseMove start_xpos, start_ypos+1, 1
}

^#LEFT:: {
	MouseGetPos(&start_xpos, &start_ypos)
	MouseMove start_xpos-1, start_ypos, 1
}

^#RIGHT:: {
	MouseGetPos(&start_xpos, &start_ypos)
	MouseMove start_xpos+1, start_ypos, 1
}

; Move mouse cursore of window on 10px
^+#UP:: {
	MouseGetPos(&start_xpos, &start_ypos)
	MouseMove start_xpos, start_ypos-10, 1
}

^+#DOWN:: {
	MouseGetPos(&start_xpos, &start_ypos)
	MouseMove start_xpos, start_ypos+10, 1
}

^+#LEFT:: {
	MouseGetPos(&start_xpos, &start_ypos)
	MouseMove start_xpos-10, start_ypos, 1
}

^+#RIGHT:: {
	MouseGetPos(&start_xpos, &start_ypos)
	MouseMove start_xpos+10, start_ypos, 1
}

;-------------------------------------------------------------------------------
#^q::{
	word := ComObjActive("Word.Application")
	if !word {
		MsgBox "Word isn't open."
	} else {
		MsgBox word.ActiveDocument.FullName
	}
}
