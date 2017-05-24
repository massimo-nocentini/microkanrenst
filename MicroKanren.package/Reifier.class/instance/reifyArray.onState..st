reification
reifyArray: aCollection onState: aState
	^ aCollection inject: aState into: [ :s :c | self reify: c onState: s ]