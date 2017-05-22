as yet unclassified
testConj
	| g |
	g := [ :a :b | (3 unifyWith: a) , (4 unifyWith: b) ] fresh.
	self assert: g solutions all equals: (LinkedList with: {3 . 4})