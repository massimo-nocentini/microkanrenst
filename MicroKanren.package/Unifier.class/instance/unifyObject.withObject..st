dispatched
unifyObject: anObj withObject: anotherObj
	^ anObj = anotherObj
		ifTrue: [ state ]
		ifFalse: [ UnificationError signal ]