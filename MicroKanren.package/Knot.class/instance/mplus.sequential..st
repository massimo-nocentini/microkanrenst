dispatched
mplus: anotherChain sequential: aSequential 
	^ item cons: [self next mplus: anotherChain sequential: aSequential]
		