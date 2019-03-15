listing
collect: aBlockClosure 
	| v |
	v := aBlockClosure value: item.
	^ v
		cons: [self next collect: aBlockClosure]