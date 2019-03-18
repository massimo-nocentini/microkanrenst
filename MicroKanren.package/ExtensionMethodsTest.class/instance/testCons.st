about linked lists
testCons
	self assert: '(0)' equals: (0 cons: nil) asString.
	self assert: '(0 1 2 3 4 5 6 7 8 9)' equals: (0 to: 9) asCons asString.
	self assert: '((1 2) 3 4 (5 (6 8)) 7)' equals: {{1. 2}. 3. 4. {5. {6. 8}}. 7} asCons asString.
	"dotted pairs notation"
	self assert: '(0 . 1)' equals: (0 cons: 1) asString.
	self assert: '(0 1 2 3 4 5 6 7 8 9 . 10)' equals: ((0 to: 9)
			asConsWithCdr: 10) asString.
	self
		assert: '(((3 . 4) . 5) 6 7)'
		equals: (((3 cons: 4)
				cons: 5)
				cons: (6
						cons: (7 cons: nil))) asString