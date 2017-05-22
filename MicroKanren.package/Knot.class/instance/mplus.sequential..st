dispatched
mplus: anotherChain sequential: aSequential
	^ [ :_ | self next value mplus: anotherChain sequential: aSequential ] links: item