unification
unifyLinkedList: aCollection withLinkedList: anotherCollection onState: aState
	^ aCollection size = anotherCollection size
		ifTrue: [ (aCollection zip: anotherCollection)
				inject: aState
				into: [ :s :pair | self unify: pair key with: pair value onState: s ] ]
		ifFalse: [ UnificationError signal ]