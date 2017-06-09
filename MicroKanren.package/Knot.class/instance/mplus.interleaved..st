dispatched
mplus: anotherChain interleaved: anInterleaved
	^ [ :_ | anotherChain value mplus: [ self next ] interleaved: anInterleaved ] links: item