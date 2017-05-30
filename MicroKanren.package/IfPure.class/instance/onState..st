running
onState: aState
	| alpha beta |
	alpha := question , answer onState: aState.
	beta := otherwise onState: aState.
	^ self streamCombinationStrategy of: (alpha mplus: beta)