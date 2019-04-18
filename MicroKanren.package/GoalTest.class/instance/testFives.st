as yet unclassified
testFives
	| g |
	g := [:x | self fives: x] fresh.
	self
		assert: (g solutions next: 10) contents
		equals: {5. 5. 5. 5. 5. 5. 5. 5. 5. 5}.
	g := [:x | self swappedfives: x] fresh.
	self
		assert: (g solutions next: 10) contents
		equals: {5. 5. 5. 5. 5. 5. 5. 5. 5. 5}