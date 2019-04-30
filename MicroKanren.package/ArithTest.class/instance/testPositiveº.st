as yet unclassified
testPositiveº
	| g µ |
	µ := Theory arith.
	g := µ positiveº value: 6 asConsedBinaryRepr.
	self assert: {Var tautology} equals: g solutions contents.
	g := µ positiveº value: 1 asConsedBinaryRepr.
	self assert: {Var tautology} equals: g solutions contents.
	g := µ positiveº value: 0 asConsedBinaryRepr.
	self assert: {} equals: g solutions contents