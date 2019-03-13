listing
atMost: n 
	^ n isZero
		ifTrue: [Chain bottom]
		ifFalse: [[self next value atMost: n - 1]
				links: item]