listing
next: n 
	^ n isZero
		ifTrue: [Chain bottom]
		ifFalse: [item cons: [self next value next: n - 1]
				]