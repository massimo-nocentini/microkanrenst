running
onState: aState 
	| combinator |
	combinator := [both onState: aState] suspended
				bind: [:anotherState | and onState: anotherState].
	^ chainCombinationStrategy of: combinator