tests
testFirstMachine
	"McCulloch's first machine"
	| g µ|
	µ := Theory montecarloLock.
	g := [:a | µ mccullochº value: a value: a] fresh.
	self assert: (g solutions next: 1) contents equals: {#(3 2 3) asCons}.
	"Montecarlo lock"
	g := [:a | µ mclockº value: a value: a] fresh.
	self
		assert: ((g solutions next: 1) contents collect: #asLinkedList)
		equals: {#(5 4 6 4 2 5 4 6 4 2)}