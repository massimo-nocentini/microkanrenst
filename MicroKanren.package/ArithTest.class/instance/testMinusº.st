as yet unclassified
testMinusº
	| g µ |
	µ := Theory arith.
	g := [:x | µ minusº
				value: 8 asConsedBinaryRepr
				value: 5 asConsedBinaryRepr
				value: x] fresh.
	self assert: {3 asConsedBinaryRepr} equals: g solutions contents.
	g := [:x | µ minusº
				value: 6 asConsedBinaryRepr
				value: 8 asConsedBinaryRepr
				value: x] fresh.
	self assert: {} equals: g solutions contents