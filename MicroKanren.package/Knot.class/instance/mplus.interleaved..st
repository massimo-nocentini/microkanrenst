dispatched
mplus: aBlockClosure interleaved: anInterleaved 
	^ item
		cons: [aBlockClosure value mplus: [rest] interleaved: anInterleaved]