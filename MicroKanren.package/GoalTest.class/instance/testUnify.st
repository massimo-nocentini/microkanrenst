as yet unclassified
testUnify
	| g |
	g := [ :q | 4 unifyWith: q ] fresh.
	self assert: g solutions all equals: {4}