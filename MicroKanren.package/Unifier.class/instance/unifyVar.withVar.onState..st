dispatched
unifyVar: aVar withVar: anotherVar onState: aState
	^ aVar = anotherVar
		ifTrue: [ aState ]
		ifFalse: [ self unifyVar: aVar withObject: anotherVar onState: aState ]