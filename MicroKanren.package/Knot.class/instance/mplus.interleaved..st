dispatched
mplus: anotherChain interleaved: anInterleaved 
	^ [anotherChain value
		mplus: [self next]
		interleaved: anInterleaved]
		links: item