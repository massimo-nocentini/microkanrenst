dispatched
mplus: anotherChain sequential: aSequential
	^ [ :useless | self next mplus: anotherChain sequential: aSequential ] links: item