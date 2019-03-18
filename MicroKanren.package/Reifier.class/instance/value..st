reification
value: anObj 
	^ (state walk: anObj)
		reifyUsing: self