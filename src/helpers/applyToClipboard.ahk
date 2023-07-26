applyToClipboard(callback) {
	ClipSaved := ClipboardAll()
	A_Clipboard := ""
	Sleep 100
	Send "^c"
	if (!ClipWait(1) || Trim(A_Clipboard) == "") {
			Say("The attempt to copy text onto the clipboard failed!", 2,,,,"ERROR")
			return
	}
	A_Clipboard := callback(A_Clipboard)
	Sleep 100
	Send "^v"
	Sleep 100
	A_Clipboard := ClipSaved
	ClipSaved := ""
}
