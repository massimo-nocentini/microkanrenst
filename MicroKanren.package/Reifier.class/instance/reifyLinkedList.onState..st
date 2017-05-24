reification
reifyLinkedList: aCollection onState: aState
	^ aCollection inject: aState into: [ :acc :c | self reify: c onState: acc ]