testing
testRepeat
	self
		assert: ((Chain repeat: 4) atMost: 10) asLinkedList
		equals: {4 . 4 . 4 . 4 . 4 . 4 . 4 . 4 . 4 . 4}