tests
testLengthº
	| g µ |
	µ := Theory sexp.
	g := µ lengthº value: {} asCons value: 0 asConsedBinaryRepr.
	self assert: g solutions contents equals: {Var tautology}.
	g := µ lengthº value: (1 to: 10) asCons value: 10 asConsedBinaryRepr.
	self assert: g solutions contents equals: {Var tautology}.
	"g := [:n | µ lengthº value: (1 to: 10) asCons value: n] fresh.
	self assert: g solutions contents equals: {10 asConsedBinaryRepr}"