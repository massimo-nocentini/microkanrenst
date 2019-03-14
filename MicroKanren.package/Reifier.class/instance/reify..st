reification
reify: anObj 
	^ (state walk: anObj)
		reifyUsing: self