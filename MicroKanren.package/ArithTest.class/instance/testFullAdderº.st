as yet unclassified
testFullAdderº
	| g µ |
	µ := Theory arith.
	g := [:x :y | µ bitFullAdderº valueWithArguments: {0. 1. 1. x. y}] fresh.
	self assert: {{0. 1}} equals: g solutions contents.
	g := µ bitFullAdderº fresh.
	self assert: {#(0 0 0 0 0) .#(1 0 0 1 0). #(0 1 1 0 1) .#(1 1 1 1 1) .#(0 1 0 1 0) .#(1 1 0 0 1). #(0 0 1 1 0). #(1 0 1 0 1)} equals: g solutions contents