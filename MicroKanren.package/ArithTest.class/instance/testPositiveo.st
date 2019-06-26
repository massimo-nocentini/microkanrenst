as yet unclassified
testPositiveo
	| g µ |
	µ := Theory arith.
	g := µ positiveo value: 6 asConsedBinaryRepr.
	self assert: {Var tautology} equals: g solutions contents.
	g := µ positiveo value: 1 asConsedBinaryRepr.
	self assert: {Var tautology} equals: g solutions contents.
	g := µ positiveo value: 0 asConsedBinaryRepr.
	self assert: {} equals: g solutions contents