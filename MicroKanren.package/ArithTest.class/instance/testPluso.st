as yet unclassified
testPluso
	| g µ |
	µ := Theory arith.
	g := [:x :y | µ pluso valueWithArguments: {x. y. 5 asConsedBinaryRepr}] fresh.
	self
		assert: ({{5. 0}. {0. 5}. {1. 4}. {4. 1}. {2. 3}. {3. 2}}
				collect: [:each | each collect: #asConsedBinaryRepr])
		equals: g solutions contents