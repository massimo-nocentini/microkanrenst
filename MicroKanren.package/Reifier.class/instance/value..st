reification
value: anObj 
	^ (state walk: anObj)
		reifyUsingReifier: self