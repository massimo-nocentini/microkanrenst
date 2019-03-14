dispatched
walkStarArray: aCollection
	^ aCollection
		collect: [:each | self walkStar: each]