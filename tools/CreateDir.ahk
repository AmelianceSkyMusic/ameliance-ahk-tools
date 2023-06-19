createFolderGUI := Gui()

createFolderGUI.MarginX := 16
createFolderGUI.MarginY := 16

createFolderGUI.Add("Text", "cCCCCCC section", "D:\Existing Folder\")  ; Save this control's position and start a new section.
createFolderGUI.Add("Text","cCCCCCC", "New Folder\Another New Folder\")
createFolderGUI.Add("Text","cCCCCCC", "Extra Line\For\Other New Folders\")

createFolderGUI.Add("Edit", "vpartOne w480 section ys")  ; Start a new column within this section.
createFolderGUI.Add("Edit", "vparttwo w500")
createFolderGUI.Add("Edit", "vpartThree w500")

selectDir := createFolderGUI.Add("Button", "vgetBtnOne section w20 hp xs+480 ys", "...")  ; xm puts it at the bottom left corner.
bthClear_1 := createFolderGUI.Add("Button", "hp xs+25 ys", "clear")  ; xm puts it at the bottom left corner.
bthClear_2 := createFolderGUI.Add("Button", "hp", "clear")  ; xm puts it at the bottom left corner.
bthClear_3 := createFolderGUI.Add("Button", "hp", "clear")  ; xm puts it at the bottom left corner.

selectDir.OnEvent("Click", (*) => dirSel(createFolderGUI))
bthClear_1.OnEvent("Click", (*) => clearInput_1(createFolderGUI))
bthClear_2.OnEvent("Click", (*) => clearInput_2(createFolderGUI))
bthClear_3.OnEvent("Click", (*) => clearInput_3(createFolderGUI))

btnOk := createFolderGUI.Add("Button", "default w725 xm hp+20", "CREATE")  ; xm puts it at the bottom left corner.
btnOk.OnEvent("Click", (*) => ProcessUserInput(createFolderGUI))


createFolderGUI.OnEvent("Close", ProcessUserExit)
createFolderGUI.OnEvent("Escape", ProcessUserExit)

createFolderGUI.BackColor := "333333"

createFolderGUI.Title := "Folder creator from path"

createFolderGUI.Opt("ToolWindow")
createFolderGUI.Opt("+E0x40000")

createFolderGUI.Show()

SoundBeep 440, 200
SoundBeep 220, 200
SoundBeep 330, 200
SoundBeep 440, 500

ProcessUserInput(thisGui, *)
{

    sevedElm := thisGui.Submit(false)  ; Save the contents of named controls into an object.
	dir_var := sevedElm.partOne "\" sevedElm.partTwo "\" sevedElm.partThree "\"
	DirCreate dir_var
	Run dir_var
	WinGetPos , , &win_x, &win_y, "A"
}

ProcessUserExit(thisGui, *) {
	WinGetPos , , &win_x, &win_y, "A"
}

dirSel(thisGui, *) {
	gPartOne := thisGui["partOne"]
	getPath := FileSelect("D", , "Select a folder")
	gPartOne.value := getPath
}

clearInput_1(thisGui, *) {
	gPartOne := thisGui["partOne"]
	gPartOne.value := ""
}

clearInput_2(thisGui, *) {
	gPartTwo := thisGui["partTwo"]
	gPartTwo.value := ""
}

clearInput_3(thisGui, *) {
	gPartThree := thisGui["PartThree"]
	gPartThree.value := ""
}
