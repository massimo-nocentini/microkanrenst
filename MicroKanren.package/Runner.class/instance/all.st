running
all
	^ (State empty into: goal) asLinkedList
		collect: [ :s | 
			| rs |
			rs := s reify: goal vars.
			rs size = 1
				ifTrue: [ rs first ]
				ifFalse: [ rs ] ]