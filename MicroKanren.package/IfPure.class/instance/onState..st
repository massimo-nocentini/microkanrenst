running
onState: aState 
	| alpha beta |
	alpha := question , answer onState: aState.
	beta := [otherwise onState: aState].
	^ chainCombinationStrategy
		of: (alpha mplus: beta)