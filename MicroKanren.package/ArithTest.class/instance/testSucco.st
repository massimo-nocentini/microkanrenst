as yet unclassified
testSucco
	| g µ |
	µ := Theory arith.
	g := µ succo value: 0 asConsedBinaryRepr value: 1 asConsedBinaryRepr.
	self assert: {Var tautology} equals: g solutions contents.
	g := µ succo value: 4 asConsedBinaryRepr value: 5 asConsedBinaryRepr.
	self assert: {Var tautology} equals: g solutions contents.
	g := µ succo value: (1 << 30 - 1) asConsedBinaryRepr value: (1 << 30) asConsedBinaryRepr.
	self assert: {Var tautology} equals: g solutions contents