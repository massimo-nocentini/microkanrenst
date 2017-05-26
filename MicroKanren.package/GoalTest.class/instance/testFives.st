as yet unclassified
testFives
	| g |
	g := [ :x | self fives: x ] fresh.
	self assert: (g solutions atMost: 10) equals: {5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5}.
	g := [ :x | self swappedfives: x ] fresh.
	self assert: (g solutions atMost: 10) equals: {5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5}