#F3:: {
    ClipSaved := ClipboardAll()
	A_Clipboard := ""
	Send "^c"
	if !ClipWait(2)
    {
        Say("No Text!",,,,,"ERR")
        return
    }
    A_Clipboard := StrUpper(A_Clipboard)
    Sleep 100
    Send "^v"
    Sleep 100
    A_Clipboard := ClipSaved
}

#F4:: {
    ClipSaved := ClipboardAll()
	A_Clipboard := ""
	Send "^c"
	if !ClipWait(2)
    {
        Say("No Text!",,,,,"ERR")
        return
    }
    A_Clipboard := StrLower(A_Clipboard)
    Sleep 100
    Send "^v"
    Sleep 100
    A_Clipboard := ClipSaved
}

#F9::
{
    ClipSaved := ClipboardAll()
	A_Clipboard := ""
	Send "^c"
	if !ClipWait(2)
    {
        Say("No Text!",,,,,"ERR")
        return
    }
    StrValue := String(A_Clipboard)

    newtext := __smartChangeCaseToLower(StrValue)
    A_Clipboard := newtext

    MsgBox A_Clipboard

    A_Clipboard := ClipSaved
}

__smartChangeCaseToLower(text) {
    newtext := ""

    Loop parse, text, "`n"
    {
        firstCharacter := SubStr(A_LoopField, 1, 1)
        otherCharacters := StrLower(SubStr(A_LoopField, 2))

        newtext := newtext firstCharacter otherCharacters
    }
    text := newtext
    newtext := ""
    Loop parse, text, "."
    {
        Loop parse, A_LoopField, ""
        {
            if !A_LoopField = " "
            {
                firstCharacter := A_LoopField
                otherCharacters := StrLower(SubStr(A_LoopField, A_Index))
                break
            }
        }
        newtext := newtext firstCharacter otherCharacters "."
    }

    return newtext

}
