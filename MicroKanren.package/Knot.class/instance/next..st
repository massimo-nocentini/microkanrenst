listing
next: n 
	^ n = 1
		ifTrue: [Chain with: item]
		ifFalse: [item
				cons: [rest next: n - 1]]