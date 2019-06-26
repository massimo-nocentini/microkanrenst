as yet unclassified
testGreaterThanOneo
	| g µ |
	µ := Theory arith.
	g := µ greaterThanOneo value: 6 asConsedBinaryRepr.
	self assert: {Var tautology} equals: g solutions contents.
	g := µ greaterThanOneo value: 1 asConsedBinaryRepr.
	self assert: {} equals: g solutions contents.
	g := µ greaterThanOneo value: 0 asConsedBinaryRepr.
	self assert: {} equals: g solutions contents.
	g := µ greaterThanOneo fresh.
	self assert: {(0
			cons: (1 cons: 2))
			collect: #asReifiedVar} equals: g solutions contents