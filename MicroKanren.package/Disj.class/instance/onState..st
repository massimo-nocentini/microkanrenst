running
onState: aState 
	^ chainCombinationStrategy
		of: ((either onState: aState)
				mplus: [or onState: aState])