as yet unclassified
testUnify
	| g |
	g := Goal fresh: [ :q | 4 unifyWith: q ].
	self assert: g solutions all equals: (LinkedList with: 4)