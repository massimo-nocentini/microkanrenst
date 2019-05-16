running
onState: aState 
	| combinator |
	combinator := [either onState: aState] suspended
				mplus: [or onState: aState].
	^ chainCombinationStrategy of: combinator