as yet unclassified
testBitAndº
	| g µ |
	µ := Theory arith.
	g := [:x :y  | µ bitAndº
				value: x
				value: y
				value: 1] fresh.
	self assert: {{1. 1}} equals: g solutions contents