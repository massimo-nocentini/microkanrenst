as yet unclassified
testHalfAddero
	| g µ |
	µ := Theory arith.
	g := [:x :y | µ bitHalfAddero
				value: x
				value: 1
				value: y
				value: 1] fresh.
	self assert: {{1. 0}} equals: g solutions contents.
	g := µ bitHalfAddero fresh.
	self assert: {#(0 0 0 0). #(0 1 1 0). #(1 0 1 0). #(1 1 0 1)} equals: g solutions contents