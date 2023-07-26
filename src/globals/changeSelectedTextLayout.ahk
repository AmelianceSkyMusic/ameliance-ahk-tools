#F5:: __changeTextEnToUk
#F6:: __changeTextUkToEn

charLangMap:= Map()
charLangMap["en"] := StrSplit("``1234567890-=qwertyuiop[]\asdfghjkl;'zxcvbnm,./~!@#$%^&*()_+QWERTYUIOP{}|ASDFGHJKL:`"ZXCVBNM<>?")
charLangMap["uk"] := StrSplit("ё1234567890-=йцукенгшщзхї\фівапролджєячсмитьбю.Ё!`"№;%:?*()_+ЙЦУКЕНГШЩЗХЇ/ФІВАПРОЛДЖЄЯЧСМИТЬБЮ,")
charLangMap["ru"] := StrSplit("ё1234567890-=йцукенгшщзхъ\фывапролджэячсмитьбю.Ё!`"№;%:?*()_+ЙЦУКЕНГШЩЗХЪ/ФЫВАПРОЛДЖЭЯЧСМИТЬБЮ,")

__changeTextEnToUk := () => applyToClipboard((text) => __changeText(text, "en", "uk"))
__changeTextEnToRu := () => applyToClipboard((text) => __changeText(text, "en", "ru"))
__changeTextUkToEn := () => applyToClipboard((text) => __changeText(text, "uk", "en"))
__changeTextUkToRu := () => applyToClipboard((text) => __changeText(text, "uk", "ru"))
__changeTextRuToEn := () => applyToClipboard((text) => __changeText(text, "ru", "en"))
__changeTextRuToUk := () => applyToClipboard((text) => __changeText(text, "ru", "uk"))

__changeText(text, from, to) {
	result := ""
	charMap := Map()
	For (index, char in charLangMap[from]) {
		charMap[char] := charLangMap[to][index]
	}

	Loop Parse (text){
		result .= charMap.Has(A_LoopField)? charMap[A_LoopField] : A_LoopField
	}
	return result
}

; __changetextUaFanToRu(text) {
;     result := ""
;     charMap := Map(StrSplit("А А а а Б Б б б В В в в Г Г г г Ґ Г ґ г Д Д д д Е Э е э Є Йэ є йэ Ж Ж ж ж З З з з И Ы и ы І И і и Ї Йи ї йи Й Й й й К К к к Л Л л л М М м м Н Н н н О О о о П П п п Р Р р р С С с с Т Т т т У У у у Ф Ф ф ф Х Х х х Ц Ц ц ц Ч Ч ч ч Ш Ш ш ш Щ Шч щ шч Ь Ь ь ь Ю Йу ю йу Я Йа я йа", " ")*)
;     Loop Parse, text{
;         result .= charMap.Has(A_LoopField)? charMap[A_LoopField] : A_LoopField
;     }
;     return result
; }

; ------------------------------------------------------------------------------
; Create the popup menu by adding some items to it.
global changeTextMenu := Menu()

changeTextMenu.Add("En to Uk", MenuHandler)
changeTextMenu.Add("En to Ru", MenuHandler)
changeTextMenu.Add
changeTextMenu.Add("Uk to En", MenuHandler)
changeTextMenu.Add("Uk to Ru", MenuHandler)
changeTextMenu.Add
changeTextMenu.Add("Ru to En", MenuHandler)
changeTextMenu.Add("Ru to Uk", MenuHandler)
changeTextMenu.Add

; ; transliteration
; changeTextMenu.Add("En translit RU", MenuHandler)
; changeTextMenu.Add("Ru translit En", MenuHandler)
; changeTextMenu.Add
; changeTextMenu.Add("En translit Ua", MenuHandler)
; changeTextMenu.Add("Ua translit En", MenuHandler)
; changeTextMenu.Add
; changeTextMenu.Add("Ua fan to Ru", MenuHandler)
; changeTextMenu.Add
; changeTextMenu.Add("Encrypt", MenuHandler)
; changeTextMenu.Add("Decrypt", MenuHandler)

MenuHandler(Item, *) {
    Switch Item
    {
        Case "En to Uk": __changeTextEnToUk
        Case "En to Ru": __changeTextEnToUk
        Case "Uk to En": __changeTextEnToUk
        Case "Uk to Ru": __changeTextEnToUk
        Case "Ru to En": __changeTextEnToUk
        Case "Ru to Uk": __changeTextEnToUk
    }
}

#F7::changeTextMenu.Show
