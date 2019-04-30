as yet unclassified
testPlusº
	| g µ |
	µ := Theory arith.
	g := [:x :y | µ plusº valueWithArguments: {x. y. 5 asConsedBinaryRepr}] fresh.
	self
		assert: ({{5. 0}. {0. 5}. {1. 4}. {4. 1}. {3. 2}. {2. 3}} collect: [:each | each collect: #asConsedBinaryRepr])
		equals: g solutions contents