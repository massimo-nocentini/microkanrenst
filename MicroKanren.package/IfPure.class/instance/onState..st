running
onState: aState
	| alpha beta |
	alpha := question , answer onState: aState.
	beta := [ otherwise onState: aState ].
	^ streamCombinationStrategy of: (alpha mplus: beta)