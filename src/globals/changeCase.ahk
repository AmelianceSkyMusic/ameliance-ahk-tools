
#F2:: applyToClipboard(StrLower)

#F3:: applyToClipboard(StrUpper)

#F4:: applyToClipboard(__smartChangeCaseToLower)

__smartChangeCaseToLower(text) {
	newtext := ""

	firstCharacter := StrUpper(SubStr(text, 1, 1))
	otherCharacters := StrLower(SubStr(text, 2))

	newtext := newtext firstCharacter otherCharacters

	return newtext
}
