running
onState: aState
	^ interleaving of: ((either onState: aState) mplus: (or onState: aState))