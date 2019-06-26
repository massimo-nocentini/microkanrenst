as yet unclassified
testBitAndo
	| g µ |
	µ := Theory arith.
	g := [:x :y | µ bitAndo
				value: x
				value: y
				value: 1] fresh.
	self assert: {{1. 1}} equals: g solutions contents