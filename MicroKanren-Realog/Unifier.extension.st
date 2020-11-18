Extension { #name : #Unifier }

{ #category : #'*MicroKanren-Realog' }
Unifier >> forRealogEmployee: anEmployee forRealogEmployee: anotherEmployee [
	^ anEmployee id = anotherEmployee id
		  ifTrue: [ state ]
		  ifFalse: [ UnificationError signal ]
]
