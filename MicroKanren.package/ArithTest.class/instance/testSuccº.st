as yet unclassified
testSuccº
	| g µ |
	µ := Theory arith.
	g := µ succº value: 0 asConsedBinaryRepr value: 1 asConsedBinaryRepr.
	self assert: {Var tautology} equals: g solutions contents.
	g := µ succº value: 4 asConsedBinaryRepr value: 5 asConsedBinaryRepr.
	self assert: {Var tautology} equals: g solutions contents