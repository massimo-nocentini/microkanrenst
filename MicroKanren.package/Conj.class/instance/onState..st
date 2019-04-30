running
onState: aState 
	^ chainCombinationStrategy
		of: ((both onState: aState)
				bind: and)