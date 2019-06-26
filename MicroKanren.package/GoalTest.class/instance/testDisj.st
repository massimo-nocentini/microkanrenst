as yet unclassified
testDisj
	| g |
	g := [:a | (3 unifyo value: a)
				| (4 unifyo value: a)] fresh.
	self assert: g solutions contents equals: {4 . 3}.
	g := [:a | (3 unifyo value: a)
				| (3 unifyo value: a)] fresh.
	self assert: g solutions contents equals: {3. 3}