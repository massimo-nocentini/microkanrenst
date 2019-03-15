listing
next: n 
	^ n = 1
		ifTrue: [Chain with: item]
		ifFalse: [item
				cons: [self next next: n - 1]]