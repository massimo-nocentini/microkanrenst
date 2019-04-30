as yet unclassified
testBitXorº
	| g µ |
	µ := Theory arith.
	g := [:x :y | µ bitXorº
				value: x
				value: y
				value: 0] fresh.
	self assert: {{0. 0}. {1. 1}} equals: g solutions contents