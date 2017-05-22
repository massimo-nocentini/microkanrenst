as yet unclassified
testFives
	| g |
	g := [ :x | self fives: x ] fresh.
	self assert: g solutions all equals: (LinkedList with: 3 with: 4)