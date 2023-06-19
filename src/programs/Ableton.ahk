#HotIf WinActive("ahk_exe Ableton Live 11 Suite.exe") || WinActive("ahk_exe Studio One.exe") || WinActive("ahk_exe Reaper.exe")

global ableton := {
	xOffset: 0,
	yOffset: 0
}

; ------------------------------------------------------------------------------
;Duplicate ASM
~LButton & RButton:: {
	Send "{Ctrl down}"
	KeyWait "LButton"
	Send "{Ctlr up}"
}

; ------------------------------------------------------------------------------
;Del ASM
~RButton & LButton:: {
	Send "{LButton}"
	Send "{Delete}"
	Send "{Esc}"
}

; ------------------------------------------------------------------------------
;Middle Mouse Button activates hand tool dragging.
MButton::
{
	Send "{Ctrl down}{Alt down}{LButton down}"
	KeyWait "MButton"
	Send "{Ctrl up}{Alt up}{LButton up}"
}

; ------------------------------------------------------------------------------
;Fullscreen
!Enter:: {
	Send "{F11}"
}

; ------------------------------------------------------------------------------
;Clipeditor
F2:: {
	Send "{F12}"
}

; ------------------------------------------------------------------------------
;Clipeditor
F6:: {
	Send "^!{vk42}" ;Ctrl+Alt+B
}

; ------------------------------------------------------------------------------
^+vk5A:: { ;Ctrl+Shift+Z — redo
	Send "^{vk59}" ;Ctrl + Y
}

; ------------------------------------------------------------------------------

d:: { ;D — Duplicate
	Send "^{vk44}" ;Ctrl+D
}

; ------------------------------------------------------------------------------
;Horizontal zoom
^+Wheelup:: {
	Send "^{Wheelup}"
}

^+Wheeldown:: {
	Send "^{Wheeldown}"
}

; ------------------------------------------------------------------------------
vkBC:: { ;, — Home
	Send "{Home}"
}

vkBE:: { ;. — End
	Send "{End}"
}

; ------------------------------------------------------------------------------
^vkBD:: { ;Ctrl+- — Purge all samples
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
		MouseClick "left", 670 + ableton.xOffset, 100 + ableton.yOffset, 1, 1
		Sleep "100"
		MouseClick "left", 670 + ableton.xOffset, 395 + ableton.yOffset, 1, 1
		Sleep "100"
		Send "{Down}"
		Send "{Down}"
		Send "{Down}"
		Send "{Enter}"
	}
	MouseMove start_xpos, start_ypos, 1
	Sleep "400"
}

^vkBB:: { ;Ctrl+= — Update sample pool
	MouseGetPos(&start_xpos, &start_ypos)
	Title := WinGetTitle("A")
	If InStr(Title, "KONTAKT"){

		MouseClick "left", 670 + ableton.xOffset, 100 + ableton.yOffset, 1, 1 ;Update sample pool
		Sleep "100"
		MouseClick "left", 670 + ableton.xOffset, 395 + ableton.yOffset, 1, 1
		Sleep "100"
		Send "{Down}"
		Send "{Down}"
		Send "{Enter}"
	}

	MouseMove start_xpos, start_ypos, 1
	Sleep "400"
}

; ------------------------------------------------------------------------------\
vkBD:: { ;- — Prev preset
	MouseGetPos(&start_xpos, &start_ypos)
	Title := WinGetTitle("A")
	If InStr(Title, "Absynth")
		MouseClick "left", 410 + ableton.xOffset, 145 + ableton.yOffset, 1, 1
	If InStr(Title, "Addictive Drums")
		MouseClick "left", 400 + ableton.xOffset, 110 + ableton.yOffset, 1, 1
	If InStr(Title, "ANA2")
		MouseClick "left", 520 + ableton.xOffset, 115 + ableton.yOffset, 1, 1
	If InStr(Title, "Analog Lab")
		MouseClick "left", 600 + ableton.xOffset, 95 + ableton.yOffset, 1, 1
	If InStr(Title, "Battery")
		MouseClick "left", 685 + ableton.xOffset, 95 + ableton.yOffset, 1, 1
	If InStr(Title, "Diva")
		MouseClick "left", 412 + ableton.xOffset, 110 + ableton.yOffset, 1, 1
	If InStr(Title, "DUNE 3")
		MouseClick "left", 568 + ableton.xOffset, 140 + ableton.yOffset, 1, 1
	If InStr(Title, "HIVE")
		MouseClick "left", 495 + ableton.xOffset, 110 + ableton.yOffset, 1, 1
	If InStr(Title, "Iris")
		MouseClick "left", 455 + ableton.xOffset, 95 + ableton.yOffset, 1, 1
	If InStr(Title, "KONTAKT")
		MouseClick "left", 640 + ableton.xOffset, 170 + ableton.yOffset, 1, 1
	If InStr(Title, "Legend")
		MouseClick "left", 785 + ableton.xOffset, 110 + ableton.yOffset, 1, 1
	If InStr(Title, "Massive")
		MouseClick "left", 602 + ableton.xOffset, 104 + ableton.yOffset, 1, 1
	If InStr(Title, "Massive X")
		MouseClick "left", 665 + ableton.xOffset, 100 + ableton.yOffset, 1, 1
	If InStr(Title, "Pigments")
		MouseClick "left", 530 + ableton.xOffset, 95 + ableton.yOffset, 1, 1
	If InStr(Title, "Repro-1")
		MouseClick "left", 438 + ableton.xOffset, 140 + ableton.yOffset, 1, 1
	If InStr(Title, "Repro-5")
		MouseClick "left", 444 + ableton.xOffset, 134 + ableton.yOffset, 1, 1
	If InStr(Title, "Serum")
		MouseClick "left", 690 + ableton.xOffset, 100 + ableton.yOffset, 1, 1 ;100
		;~ MouseClick "left", 620 + ableton.xOffset, 95 + ableton.yOffset, 1, 1 ;90
	If InStr(Title, "Spire")
		MouseClick "left", 294 + ableton.xOffset, 108 + ableton.yOffset, 1, 1
	If InStr(Title, "Sylenth1")
		MouseClick "left", 612 + ableton.xOffset, 246 + ableton.yOffset, 1, 1
	If InStr(Title, "SynthMaster2")
		MouseClick "left", 570 + ableton.xOffset, 90 + ableton.yOffset, 1, 1
	If InStr(Title, "TAL Sampler")
		MouseClick "left", 555 + ableton.xOffset, 100 + ableton.yOffset, 1, 1
	If InStr(Title, "Avenger")
		;~ MouseClick "left", 445 + ableton.xOffset, 110 + ableton.yOffset, 1, 1 ;100
		MouseClick "left", 312 + ableton.xOffset, 100 + ableton.yOffset, 1, 1 ;70
	If InStr(Title, "Zebra")
		MouseClick "left", 428 + ableton.xOffset, 108 + ableton.yOffset, 1, 1

	If InStr(Title, "Impact")
		MouseClick "left", 84 + ableton.xOffset, 54 + ableton.yOffset, 1, 1
	If InStr(Title, "Mai Tai")
		MouseClick "left", 84 + ableton.xOffset, 54 + ableton.yOffset, 1, 1
	If InStr(Title, "Mojito")
		MouseClick "left", 84 + ableton.xOffset, 54 + ableton.yOffset, 1, 1
	If InStr(Title, "Presence")
		MouseClick "left", 84 + ableton.xOffset, 54 + ableton.yOffset, 1, 1
	If InStr(Title, "SampleOne")
		MouseClick "left", 84 + ableton.xOffset, 54 + ableton.yOffset, 1, 1
	If InStr(Title, "ReaScript Development Environment"){
		Send "-"
		return
		}
	MouseMove start_xpos, start_ypos, 1
	Sleep "400"
}

;= — Next preset
vkBB::
{
	MouseGetPos(&start_xpos, &start_ypos)
	Title := WinGetTitle("A")
	If InStr(Title, "Absynth")
		MouseClick "left", 430 + ableton.xOffset, 145 + ableton.yOffset, 1, 1
	If InStr(Title, "Addictive Drums")
		MouseClick "left", 400 + ableton.xOffset, 130 + ableton.yOffset, 1, 1
	If InStr(Title, "ANA2")
		MouseClick "left", 536 + ableton.xOffset, 115 + ableton.yOffset, 1, 1
	If InStr(Title, "Analog Lab")
		MouseClick "left", 630 + ableton.xOffset, 95 + ableton.yOffset, 1, 1
	If InStr(Title, "Battery")
		MouseClick "left", 685 + ableton.xOffset, 105 + ableton.yOffset, 1, 1
	If InStr(Title, "Diva")
		MouseClick "left", 666 + ableton.xOffset, 110 + ableton.yOffset, 1, 1
	If InStr(Title, "DUNE 3")
		MouseClick "left", 590 + ableton.xOffset, 140 + ableton.yOffset, 1, 1
	If InStr(Title, "HIVE")
		MouseClick "left", 765 + ableton.xOffset, 110 + ableton.yOffset, 1, 1
	If InStr(Title, "Iris")
		MouseClick "left", 455 + ableton.xOffset, 105 + ableton.yOffset, 1, 1
	If InStr(Title, "KONTAKT")
		MouseClick "left", 660 + ableton.xOffset, 170 + ableton.yOffset, 1, 1
	If InStr(Title, "Legend")
		MouseClick "left", 795 + ableton.xOffset, 110 + ableton.yOffset, 1, 1
	If InStr(Title, "Massive")
		MouseClick "left", 602 + ableton.xOffset, 122 + ableton.yOffset, 1, 1
	If InStr(Title, "Massive X")
		MouseClick "left", 680 + ableton.xOffset, 100 + ableton.yOffset, 1, 1
	If InStr(Title, "Pigments")
		MouseClick "left", 560 + ableton.xOffset, 95 + ableton.yOffset, 1, 1
	If InStr(Title, "Repro-1")
		MouseClick "left", 684 + ableton.xOffset, 140 + ableton.yOffset, 1, 1
	If InStr(Title, "Repro-5")
		MouseClick "left", 674 + ableton.xOffset, 134 + ableton.yOffset, 1, 1
	If InStr(Title, "Serum")
		MouseClick "left", 710 + ableton.xOffset, 100 + ableton.yOffset, 1, 1
	If InStr(Title, "Spire")
		MouseClick "left", 330 + ableton.xOffset, 108 + ableton.yOffset, 1, 1
	If InStr(Title, "Sylenth1")
		MouseClick "left", 612 + ableton.xOffset, 256 + ableton.yOffset, 1, 1
	If InStr(Title, "SynthMaster2")
		MouseClick "left", 590 + ableton.xOffset, 90 + ableton.yOffset, 1, 1
	If InStr(Title, "TAL Sampler")
		MouseClick "left", 835 + ableton.xOffset, 100 + ableton.yOffset, 1, 1
	If InStr(Title, "Avenger")
		MouseClick "left", 322 + ableton.xOffset, 100 + ableton.yOffset, 1, 1
	If InStr(Title, "Zebra")
		MouseClick "left", 722 + ableton.xOffset, 108 + ableton.yOffset, 1, 1

	If InStr(Title, "Impact")
		MouseClick "left", 98 + ableton.xOffset, 54 + ableton.yOffset, 1, 1
	If InStr(Title, "Mai Tai")
		MouseClick "left", 98 + ableton.xOffset, 54 + ableton.yOffset, 1, 1
	If InStr(Title, "Mojito")
		MouseClick "left", 98 + ableton.xOffset, 54 + ableton.yOffset, 1, 1
	If InStr(Title, "Presence")
		MouseClick "left", 98 + ableton.xOffset, 54 + ableton.yOffset, 1, 1
	If InStr(Title, "SampleOne")
		MouseClick "left", 98 + ableton.xOffset, 54 + ableton.yOffset, 1, 1
	If InStr(Title, "ReaScript Development Environment") {
		Send "="
		return
		}
	MouseMove start_xpos, start_ypos, 1
	Sleep "400"
}
