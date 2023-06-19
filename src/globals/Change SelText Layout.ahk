#F5::__textEnToRu
#F6::__textRuToEn

__textEnToRu() {
    ClipSaved := ClipboardAll()
	A_Clipboard := ""
	Send "^c"
	if !ClipWait(2)
    {
        Say("No Text!",,,,,"ERR")
        return
    }
    StrValue := String(A_Clipboard)

    newtext := __changeTextEnToRu(StrValue)

    A_Clipboard := newtext
    Msg(A_Clipboard, 3)
    Sleep 100
    Send "^v"
    Sleep 100
    A_Clipboard := ClipSaved
}


__textRuToEn() {
    ClipSaved := ClipboardAll()
	A_Clipboard := ""
	Send "^c"
	if !ClipWait(2)
    {
        Say("No Text!",,,,,"ERR")
        return
    }
    StrValue := String(A_Clipboard)

    newtext := __changeTextRuToEn(StrValue)

    A_Clipboard := newtext
    Msg(A_Clipboard, 3)
    Sleep 100
    Send "^v"
    Sleep 100
    A_Clipboard := ClipSaved
}



__textEnToUa() {
    ClipSaved := ClipboardAll()
	A_Clipboard := ""
	Send "^c"
	if !ClipWait(2)
    {
        Say("No Text!",,,,,"ERR")
        return
    }
    StrValue := String(A_Clipboard)

    newtext := __changeTextEnToUa(StrValue)

    A_Clipboard := newtext
    Msg(A_Clipboard, 3)
    Sleep 100
    Send "^v"
    Sleep 100
    A_Clipboard := ClipSaved
}



__textUaToEn() {
    ClipSaved := ClipboardAll()
	A_Clipboard := ""
	Send "^c"
	if !ClipWait(2)
    {
        Say("No Text!",,,,,"ERR")
        return
    }
    StrValue := String(A_Clipboard)

    newtext := __changeTextUaToEn(StrValue)

    A_Clipboard := newtext
    Msg(A_Clipboard, 3)
    Sleep 100
    Send "^v"
    Sleep 100
    A_Clipboard := ClipSaved
}

__changeTextEnToRu(text) {
    result := ""
    charMap := Map(StrSplit("qйwцeуrкtеyнuгiшoщpз[х]ъaфsыdвfаgпhрjоkлlд;ж'э\\zяxчcсvмbиnтmь,б.ю/.QЙWЦEУRКTЕYНUГIШOЩPЗ{Х}ЪAФSЫDВFАGПHРJОKЛLД:Ж`"Э|/ZЯXЧCСVМBИNТMЬ<Б>Ю?,!!@`"#№$;%%^:&?**(())__++``ё~Ё  ")*)
    Loop Parse, text{
        result .= charMap.Has(A_LoopField)? charMap[A_LoopField] : A_LoopField
    }
    return result
}

__changeTextRuToEn(text) {
    result := ""
    charMap := Map(StrSplit("йqцwуeкrеtнyгuшiщoзpх[ъ]фaыsвdаfпgрhоjлkдlж;э'\\яzчxсcмvиbтnьmб,ю../ЙQЦWУEКRЕTНYГUШIЩOЗPХ{Ъ}ФAЫSВDАFПGРHОJЛKДLЖ:Э`"/|ЯZЧXСCМVИBТNЬMБ<Ю>,?!!`"@№#;$%%:^?&**(())__++ё``Ё~  ")*)
    Loop Parse, text{
        result .= charMap.Has(A_LoopField)? charMap[A_LoopField] : A_LoopField
    }
    return result
}

__changeTextEnToUa(text) {
    result := ""
    charMap := Map(StrSplit("qйwцeуrкtеyнuгiшoщpз[х]їaфsіdвfаgпhрjоkлlд;ж'є\\zяxчcсvмbиnтmь,б.ю/.QЙWЦEУRКTЕYНUГIШOЩPЗ{Х}їAФSіDВFАGПHРJОKЛLД:Ж`"є|/ZЯXЧCСVМBИNТMЬ<Б>Ю?,!!@`"#№$;%%^:&?**(())__++``'~₴  ")*)
    Loop Parse, text{
        result .= charMap.Has(A_LoopField)? charMap[A_LoopField] : A_LoopField
    }
    return result
}

__changeTextUaToEn(text) {
    result := ""
    charMap := Map(StrSplit("йqцwуeкrеtнyгuшiщoзpх[ї]фaіsвdаfпgрhоjлkдlж;є'\\яzчxсcмvиbтnьmб,ю../ЙQЦWУEКRЕTНYГUШIЩOЗPХ{Ї}ФAІSВDАFПGРHОJЛKДLЖ:Є`"/|ЯZЧXСCМVИBТNЬMБ<Ю>,?!!`"@№#;$%%:^?&**(())__++'``₴~  ")*)
    Loop Parse, text{
        result .= charMap.Has(A_LoopField)? charMap[A_LoopField] : A_LoopField
    }
    return result
}

; ------------------------------------------------------------------------------
#F8::__textUaFanToRu

__textUaFanToRu() {
    ClipSaved := ClipboardAll()
	A_Clipboard := ""
	Send "^c"
	if !ClipWait(2)
    {
        Say("No Text!",,,,,"ERR")
        return
    }
    StrValue := String(A_Clipboard)

    newtext := changetextUaFanToRu_FC(StrValue)

    A_Clipboard := newtext
    Msg(A_Clipboard, 3)
    Sleep 100
    Send "^v"
    Sleep 100
    A_Clipboard := ClipSaved
}

__changetextUaFanToRu(text) {
    result := ""
    charMap := Map(StrSplit("А А а а Б Б б б В В в в Г Г г г Ґ Г ґ г Д Д д д Е Э е э Є Йэ є йэ Ж Ж ж ж З З з з И Ы и ы І И і и Ї Йи ї йи Й Й й й К К к к Л Л л л М М м м Н Н н н О О о о П П п п Р Р р р С С с с Т Т т т У У у у Ф Ф ф ф Х Х х х Ц Ц ц ц Ч Ч ч ч Ш Ш ш ш Щ Шч щ шч Ь Ь ь ь Ю Йу ю йу Я Йа я йа", " ")*)
    Loop Parse, text{
        result .= charMap.Has(A_LoopField)? charMap[A_LoopField] : A_LoopField
    }
    return result
}

; ------------------------------------------------------------------------------
; Create the popup menu by adding some items to it.
global changeTextMenu := Menu()

changeTextMenu.Add("En to RU", MenuHandler)
changeTextMenu.Add("Ru to En", MenuHandler)
changeTextMenu.Add
changeTextMenu.Add("En to Ua", MenuHandler)
changeTextMenu.Add("Ua to En", MenuHandler)
changeTextMenu.Add

; transliteration
changeTextMenu.Add("En translit RU", MenuHandler)
changeTextMenu.Add("Ru translit En", MenuHandler)
changeTextMenu.Add
changeTextMenu.Add("En translit Ua", MenuHandler)
changeTextMenu.Add("Ua translit En", MenuHandler)
changeTextMenu.Add
changeTextMenu.Add("Ua fan to Ru", MenuHandler)
changeTextMenu.Add
changeTextMenu.Add("Encrypt", MenuHandler)
changeTextMenu.Add("Decrypt", MenuHandler)

MenuHandler(Item, *) {
    Switch Item
    {
        Case "En to RU": textEnToRu_FC
        Case "Ru to En": textRuToEn_FC
        Case "En to Ua": textEnToUa_FC
        Case "Ua to En": textUaToEn_FC
        Case "Ua fan to Ru": textUaFanToRu_FC
    }
}

#F7::changeTextMenu.Show
