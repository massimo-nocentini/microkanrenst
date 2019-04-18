as yet unclassified
testNats
	| g M |
	M := 1000.
	g := [:x | self nats: x] fresh.
	self
		assert: (g solutions next: M) contents
		equals: (0 to: M - 1)