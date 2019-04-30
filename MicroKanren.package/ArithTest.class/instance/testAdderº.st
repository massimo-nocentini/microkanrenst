as yet unclassified
testAdderº
	| g µ |
	µ := Theory arith.
	g := [:x :y :r | µ adderº valueWithArguments: {0. x. y. r}] fresh.
	self assert: {{0 asReifiedVar. 0 asConsedBinaryRepr. 0 asReifiedVar}. {0 asConsedBinaryRepr. 0 asReifiedVar cons: 1 asReifiedVar. 0 asReifiedVar cons: 1 asReifiedVar}. {1. 1. 2} collect: #asConsedBinaryRepr} equals: (g solutions next: 3) contents