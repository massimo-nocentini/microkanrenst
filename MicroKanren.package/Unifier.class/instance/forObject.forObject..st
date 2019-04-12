unification
forObject: anObj forObject: anotherObj
	^ anObj = anotherObj
		ifTrue: [state]
		ifFalse: [UnificationError signal]