dispatched
mplus: anotherChain interleaved: anInterleaved
	^ [ :useless | anotherChain value mplus: [ self next ] interleaved: anInterleaved ] links: item