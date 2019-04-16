about linked lists
testGraph
	| G |
	G := {#a -> #b. #b -> #c. #c -> #d. #d -> #a} asGraph.
	
	self
		assert: {#b}
		equals: ((G vertices at: #a)
				at: #outgoings).
	self
		assert: {#d}
		equals: ((G vertices at: #a)
				at: #incomings)