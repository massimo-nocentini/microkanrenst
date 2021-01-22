Extension { #name : #Symbol }

{ #category : #'*MicroKanren' }
Symbol >> reifyUsingReifier: aReifier [

	^ aReifier forObject: self
]

{ #category : #'*MicroKanren' }
Symbol >> unifyWith: anObject usingUnifier: anUnifier [

	^ anObject unifyWithObject: self usingUnifier: anUnifier
]

{ #category : #'*MicroKanren' }
Symbol >> walkStarUsingWalker: aWalker [

	^ aWalker forObject: self
]
