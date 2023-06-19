Img := {
	find: __find,
	findAndWait: __findAndWait,
	click: __click,
	findClick: __findAndClick,
	findAndWaitAndClick: __findAndWaitAndClick
}

;------------------------------------------------------------------------------
__find(
	this,
	imgPath,
	startX := 0,
	startY := 0,
	endX := unset,
	endY := unset,
	mode := "Screen"
) {
	; set coord mode
	CoordMode("Mouse", mode)
	CoordMode("Pixel", mode)

	; update endX endY coordinates
	if (mode := "Screen") {
		if (!IsSet(endX)) {
			endX := A_ScreenWidth
		}
		if (!IsSet(endY)) {
			endY := A_ScreenHeight
		}
	} else if (mode := "Screen") {
		WinGetPos &X, &Y, &W, &H, "A"
		if (!IsSet(endX)) {
			endX := W
		}
		if (!IsSet(endY)) {
			endY := H
		}
	} else if (mode := "Client") {
		MsgBox "client mode not ready"
		return
	}

	isImage := false
	foundX := unset
	foundY := unset

	pathParts := StrSplit(imgPath, "\")

	fileName := pathParts[pathParts.Length]

	Try {
		if (ImageSearch(&foundX, &foundY, startX, startY, endX, endY, imgPath)) {
			isImage := true
		}
	} catch Error {
		Say("Can't find image file:`n" fileName, , , , , "ERROR")
		return
	}

	CoordMode "Mouse", "Screen"
	CoordMode "Pixel", "Screen"

	return { isImage: isImage, x: foundX ?? unset, y: foundY ?? unset }
}

;------------------------------------------------------------------------------
__findAndWait(
	this,
	imgPath,
	startX := 0,
	startY := 0,
	endX := unset,
	endY := unset,
	mode := "Screen",
	searchAreaOffset := 0
) {

	; updateCoord(&startX, &startY, &endX, &endY) {
	; 	Msg("updateCoord")
	; 	Sleep 1000
	; 	MouseGetPos(&updatedXPos, &updatedYPos)
	; 	startX := updatedXPos - searchAreaOffset
	; 	startX := startX >= 0 ? startX : 0

	; 	startY := updatedYPos - searchAreaOffset
	; 	startY := startY >= 0 ? startY : 0

	; 	endX := updatedXPos + searchAreaOffset
	; 	endX := endX <= A_ScreenWidth ? endX : A_ScreenWidth

	; 	endY := updatedYPos + searchAreaOffset
	; 	endY := endY <= A_ScreenWidth ? endY : A_ScreenWidth
	; }


	findImg() {
		imgState := this.find(imgPath, startX, startY, endX ?? unset, endY ?? unset, mode)
		isImage := imgState.isImage
		foundX := imgState.x
		foundY := imgState.y
		return { isImage: isImage, x: foundX ?? unset, y: foundY ?? unset }
	}

	image := findImg()
	progress := 0
	while (!image.isImage && progress <= 99) {
		; If (searchAreaOffset > 0) {
		; 	updateCoord(&startX, &startY, &endX, &endY)
		; }
		Tooltip("Searching: " progress "%")
		image := findImg()
		Sleep 1
		progress++
	}

	if (progress >= 99) {
		Msg("Can't find image!")
	}

	if (image.isImage) {
		Tooltip
	}

	isImage := image.isImage
	foundX := image.x
	foundY := image.y
	return { isImage: isImage, x: foundX ?? unset, y: foundY ?? unset }
}


;------------------------------------------------------------------------------
__click(
	this,
	x,
	y,
	xOffset := 0,
	yOffset := 0,
	clicks := 1,
	moveBack := true,
	speed := 0,
	delay := 0
) {
	if (!IsSet(x) && !IsSet(y)) {
		Msg("ERROR: wrong coordinates")
		return
	}

	MouseGetPos(&startX, &startY)

	clickX := x + xOffset
	clickY := y + yOffset

	if (speed > 0) {
		SendMode("Event")
	} else {
		SendMode("Input")
	}

	MouseMove(clickX, clickY, speed)
	Sleep(delay)
	Click(clicks)
	if (moveBack) {
		MouseMove(startX, startY, speed)
	}

	SendMode("Input")
}

;------------------------------------------------------------------------------
__findAndClick(
	this,
	imgPath,
	startX := 0,
	startY := 0,
	endX := unset,
	endY := unset,
	xOffset := 0,
	yOffset := 0,
	mode := "Screen",
	clicks := 1,
	moveBack := true,
	speed := 0,
	delay := 0
) {
	imgFind := this.find(
		imgPath,
		startX,
		startY,
		endX ?? unset,
		endY ?? unset,
		mode
	)
	if (imgFind.isImage) {
		this.click(
			imgFind.x,
			imgFind.y,
			xOffset,
			yOffset,
			clicks,
			moveBack,
			speed,
			delay
		)
	}
	return imgFind.isImage
}

;------------------------------------------------------------------------------
__findAndWaitAndClick(
	this,
	imgPath,
	startX := 0,
	startY := 0,
	endX := unset,
	endY := unset,
	xOffset := 0,
	yOffset := 0,
	mode := "Screen",
	searchAreaOffset := 0,
	clicks := 1,
	moveBack := true,
	speed := 0,
	delay := 0
) {
	imgFind := this.findAndWait(
		imgPath,
		startX,
		startY,
		endX ?? unset,
		endY ?? unset,
		mode,
		searchAreaOffset
	)
	if (imgFind.isImage) {
		this.click(
			imgFind.x,
			imgFind.y,
			xOffset,
			yOffset,
			clicks,
			moveBack,
			speed,
			delay
		)
	}
	return imgFind.isImage
}
