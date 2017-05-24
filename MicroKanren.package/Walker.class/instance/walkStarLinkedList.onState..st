dispatched
walkStarLinkedList: aCollection onState: aState
	^ aCollection collect: [ :each | self walkStar: each onState: aState ]