running
onState: aState
	^ interleaving of: ((both onState: aState) value bind: and)