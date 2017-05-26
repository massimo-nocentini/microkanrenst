running
onState: aState
	^ interleaving of: ((either onState: aState) value mplus: (or onState: aState))