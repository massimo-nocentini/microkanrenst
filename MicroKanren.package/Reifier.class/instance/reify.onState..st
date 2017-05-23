reification
reify: anObj onState: aState
	^ (aState walk: anObj) reifyUsing: self onState: aState