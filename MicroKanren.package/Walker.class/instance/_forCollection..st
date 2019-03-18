dispatched
_forCollection: aCollection 
	^ aCollection
		collect: [:each | self value: each]