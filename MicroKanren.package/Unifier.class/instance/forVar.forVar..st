dispatched
forVar: aVar forVar: anotherVar
	^ aVar = anotherVar
		ifTrue: [state]
		ifFalse: [self
				forVar: aVar
				forObject: anotherVar]