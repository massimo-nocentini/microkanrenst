as yet unclassified
testHalfAdderº
	| g µ |
	µ := Theory arith.
	g := [:x :y | µ bitHalfAdderº
				value: x
				value: 1
				value: y
				value: 1] fresh.
	self assert: {{1. 0}} equals: g solutions contents.
	g := µ bitHalfAdderº fresh.
	self assert: {#(0 0 0 0) .#(0 1 1 0). #(1 0 1 0). #(1 1 0 1)} equals: g solutions contents