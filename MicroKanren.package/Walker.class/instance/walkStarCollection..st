dispatched
walkStarCollection: aCollection 
	^ aCollection
		collect: [:each | self walkStar: each]