as yet unclassified
testGreaterThanOneº
	| g µ |
	µ := Theory arith.
	g := µ greaterThanOneº value: 6 asConsedBinaryRepr.
	self assert: {Var tautology} equals: g solutions contents.
	g := µ greaterThanOneº value: 1 asConsedBinaryRepr.
	self assert: {} equals: g solutions contents.
	g := µ greaterThanOneº value: 0 asConsedBinaryRepr.
	self assert: {} equals: g solutions contents.
	g := µ greaterThanOneº fresh.
	self assert: { (0 cons: (1 cons: 2)) collect: #asReifiedVar} equals: g solutions contents