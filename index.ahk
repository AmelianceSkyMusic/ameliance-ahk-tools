#SingleInstance Force
Persistent
; SetKeyDelay -1
; SendMode "Play"
SetKeyDelay 0
SetWinDelay -1
; SetMouseDelay 0
SetStoreCapsLockMode 0
SetDefaultMouseSpeed 0
SetWorkingDir A_ScriptDir
; SetWorkingDir A_InitialWorkingDir
; CoordMode "Mouse"
; CoordMode "Pixel"
A_MaxHotkeysPerInterval := 200

!#Esc::{
	Try
	Run "INDEX_RUN.bat"
	catch Error
		MsgBox("Cant find file")
	ExitApp
}

!Esc::reload

; *i — ingnor syntax errors if it is not critical for main script
; #Include lib\Native\Native.ahk
#Include lib\_index.ahk
#Include src\helpers\_index.ahk
#Include src\constants\_index.ahk
#Include src\utils\_index.ahk
#Include src\hotkeys\_index.ahk
#Include src\rebind\_index.ahk
#Include src\programs\_index.ahk
#Include src\snippets\_index.ahk
#Include src\menus\_index.ahk
#Include src\globals\_index.ahk

; -----------------------------------------------------------------
; --------------------------- TRAY MENU ---------------------------
; -----------------------------------------------------------------

TraySetIcon("src\assets\icon.ico", ,1)

; -----------------------------------------------------------------
; ----------------------- #INCLUDE MODULES ------------------------
; -----------------------------------------------------------------

; #Include Hotstrings\Data.ahk


; #HotIf

; ProgramMenu := CreateMenu("Programs", A_ScriptDir "\src\menus\Programs")

; ~LShift:: {
; 	if Multitap("LShift") = 2 {
; 		PostMessage(0x0050, 0, 0x4090409, , "A")
; 		ProgramMenu.Show()
; 	}
; }

; obj := {
; 	a: "hello"
; }

; var := jxon_dump(obj, indent:=0)
; MsgBox var

Say("SCRIPTS WERE LOADED", 1)
SoundBeep 440, 125
SoundBeep 220, 250
