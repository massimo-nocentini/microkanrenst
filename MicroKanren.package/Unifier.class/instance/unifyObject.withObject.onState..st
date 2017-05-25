unification
unifyObject: anObj withObject: anotherObj onState: aState
	^ anObj = anotherObj
		ifTrue: [ aState ]
		ifFalse: [ UnificationError signal ]