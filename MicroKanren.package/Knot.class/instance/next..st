listing
next: n 
	^ n isZero
		ifTrue: [Chain bottom]
		ifFalse: [[self next value next: n - 1]
				links: item]