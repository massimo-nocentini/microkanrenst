dispatched
mplus: anotherChain sequential: aSequential 
	^ item
		cons: [rest mplus: anotherChain sequential: aSequential]