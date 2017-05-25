unification
unifyLinkedList: aCollection withLinkedList: anotherCollection onState: aState
	^ aCollection size = anotherCollection size
		ifTrue: [ (aCollection zip: anotherCollection)
				inject: aState
				into: [ :s :pair | pair key unifyWith: pair value usingUnifier: self onState: s ] ]
		ifFalse: [ UnificationError signal ]