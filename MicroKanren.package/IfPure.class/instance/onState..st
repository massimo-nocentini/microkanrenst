running
onState: aState 
	| alpha beta |
	alpha := [question , answer onState: aState] suspended.
	beta := [otherwise onState: aState].
	^ chainCombinationStrategy
		of: (alpha mplus: beta)