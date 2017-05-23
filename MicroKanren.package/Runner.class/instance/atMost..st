selecting
atMost: anInteger
	^ self reify: ((State empty into: goal) atMost: anInteger) asLinkedList