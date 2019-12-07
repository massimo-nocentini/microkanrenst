Extension { #name : #Srfi41Stream }

{ #category : #'*MicroKanren' }
Srfi41Stream >> contents [
	^ self asOrderedCollection
]
