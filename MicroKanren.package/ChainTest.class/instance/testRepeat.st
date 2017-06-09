testing
testRepeat
	self
		assert: ((Chain repeat: 4) atMost: 10) mature
		equals: {4 . 4 . 4 . 4 . 4 . 4 . 4 . 4 . 4 . 4}