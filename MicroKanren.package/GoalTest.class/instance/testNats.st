as yet unclassified
testNats
	| g M |
	M := 1000.
	g := [ :x | self nats: x ] fresh.
	self assert: (g solutions atMost: M) equals: (0 to: M - 1)