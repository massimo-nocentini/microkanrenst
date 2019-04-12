running
onState: aState 
	| reifier |
	reifier := aState walker.
	^ ((reifier value: x)
		= (reifier value: y)) asGoal onState: aState