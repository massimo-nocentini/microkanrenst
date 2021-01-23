Extension { #name : #Object }

{ #category : #'*MicroKanren-Realog' }
Object >> unifyWithRealogCompany: aCompany usingUnifier: anUnifier [

	^ self unifyWithObject: aCompany usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-Realog' }
Object >> unifyWithRealogContract: aContract usingUnifier: anUnifier [

	^ self unifyWithObject: aContract usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-Realog' }
Object >> unifyWithRealogEmployee: anEmployee usingUnifier: anUnifier [

	^ self unifyWithObject: anEmployee usingUnifier: anUnifier
]
