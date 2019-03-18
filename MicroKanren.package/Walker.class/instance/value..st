dispatching
value: aVar 
	^ (state walk: aVar)
		walkStarUsingWalker: self