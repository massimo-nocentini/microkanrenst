as yet unclassified
testDisj
	| g |
	g := [ :a | (3 unifyWith: a) | (4 unifyWith: a) ] fresh.
	self assert: g solutions all equals: (LinkedList with: 3 with: 4)