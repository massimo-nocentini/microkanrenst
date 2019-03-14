helpers
collatz: o 
	^ o cons: [o even
		ifTrue: [self collatz: o / 2]
		ifFalse: [self collatz: 3 * o + 1]]
		