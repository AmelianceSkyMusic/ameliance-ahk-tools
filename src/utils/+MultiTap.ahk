MultiTap(key, delay := 200) {
	counter := 1
	while KeyWait(key, "T." delay)

		if KeyWait(key, "D T.1") {
			counter++
		} else {
			return counter
		}

	KeyWait(key)

	return -counter
}
