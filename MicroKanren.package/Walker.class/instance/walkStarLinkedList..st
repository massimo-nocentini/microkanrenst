dispatched
walkStarLinkedList: aCollection
	^ aCollection
		collect: [:each | self walkStar: each]