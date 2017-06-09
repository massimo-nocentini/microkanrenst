running
onState: aState
	^ interleaving of: ((both onState: aState) bind: and)