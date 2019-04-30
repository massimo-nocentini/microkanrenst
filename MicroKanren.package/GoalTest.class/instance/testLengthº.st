tests
testLengthº
	| g µ |
	µ := Theory sexp.
	g := [:n | µ lengthº value: '' asCons value: n] fresh.
	self assert: g solutions contents equals: {0 asConsedBinaryRepr}.
	"g := [:n | µ lengthº value: 'a' asCons value: n] fresh.
	self assert: (g solutions next: 10) contents equals: {1 asConsedBinaryRepr}"