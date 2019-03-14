helpers
ints: i 
	^ i cons: [self ints: i + 1]
		