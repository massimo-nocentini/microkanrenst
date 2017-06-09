dispatched
mplus: anotherChain sequential: aSequential
	^ [ :_ | self next mplus: anotherChain sequential: aSequential ] links: item