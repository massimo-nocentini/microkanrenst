dispatched
mplus: anotherChain interleaved: anInterleaved 
	^ item
		cons: [anotherChain value
				mplus: [rest]
				interleaved: anInterleaved]