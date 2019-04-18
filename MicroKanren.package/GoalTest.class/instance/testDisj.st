as yet unclassified
testDisj
	| g |
	g := [:a | (3 =° a)
				| (4 =° a)] fresh.
	self assert: g solutions contents equals: {3. 4}.
	g := [:a | (3 =° a)
				| (3 =° a)] fresh.
	self assert: g solutions contents equals: {3. 3}