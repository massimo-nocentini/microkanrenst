tests
testLengthº
	| g µ |
	µ := Theory sexp.
	g := µ lengthº value: {} asCons value: 0 asConsedBinaryRepr.
	self assert: g solutions contents equals: {Var tautology}.
	g := µ lengthº §§ {(1 to: 10) asCons. 10 asConsedBinaryRepr}.
	self assert: g solutions contents equals: {Var tautology}.
	g := [:lst | µ lengthº §§ {lst. 3 asConsedBinaryRepr}] fresh.
	self assert: g solutions contents equals: {{0 asReifiedVar. 1 asReifiedVar. 2 asReifiedVar} asCons}.
	g := [:n | µ lengthº §§ {(1 to: 10) asCons. 0 cons: n}] fresh.
	self assert: (g solutions next: 1) contents equals: {5 asConsedBinaryRepr}