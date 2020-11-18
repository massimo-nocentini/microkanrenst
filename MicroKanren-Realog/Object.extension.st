Extension { #name : #Object }

{ #category : #'*MicroKanren-Realog' }
Object >> unifyWithRealogEmployee: anEmployee usingUnifier: anUnifier [
	^ anUnifier forObject: self forObject: anEmployee
]
