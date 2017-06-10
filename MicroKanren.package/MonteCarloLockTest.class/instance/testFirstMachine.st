tests
testFirstMachine
	| g |
	g := [ :a | self mcculloch proves: a relates: a ] fresh.
	self assert: (g solutions atMost: 1) equals: {#(3 2 3) asCons}.
	g := [ :a | self mclock proves: a relates: a ] fresh.
	self
		assert: ((g solutions atMost: 3) collect: #asLinkedList)
		equals: {#(5 4 6 4 2 5 4 6 4 2)}