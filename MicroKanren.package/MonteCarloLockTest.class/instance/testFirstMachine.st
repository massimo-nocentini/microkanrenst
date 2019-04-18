tests
testFirstMachine
	"McCulloch's first machine"
	| g |
	g := [:a | self mcculloch proves: a relates: a] fresh.
	self assert: (g solutions next: 1) contents equals: {#(3 2 3) asCons}.
	"Montecarlo lock"
	g := [:a | self mclock proves: a relates: a] fresh.
	self
		assert: ((g solutions next: 1) contents
				collect: #asLinkedList)
		equals: {#(5 4 6 4 2 5 4 6 4 2)}