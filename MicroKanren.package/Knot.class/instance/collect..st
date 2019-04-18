listing
collect: aBlockClosure 
	| v |
	v := aBlockClosure value: item.
	^ v
		cons: [rest collect: aBlockClosure]