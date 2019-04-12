unification
forLinkedList: aCollection forLinkedList: anotherCollection 
	^ aCollection size = anotherCollection size
		ifTrue: [(aCollection zip: anotherCollection)
				inject: state
				into: [:s :pair | s unifier value: pair key value: pair value]]
		ifFalse: [UnificationError signal]