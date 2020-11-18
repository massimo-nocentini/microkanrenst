Extension { #name : #Object }

{ #category : #'*MicroKanren-Realog' }
Object >> unifyWithRealogCompany: aCompany usingUnifier: anUnifier [
	^ anUnifier forObject: self forObject: aCompany
]

{ #category : #'*MicroKanren-Realog' }
Object >> unifyWithRealogContract: aContract usingUnifier: anUnifier [
	^ anUnifier forObject: self forObject: aContract
]

{ #category : #'*MicroKanren-Realog' }
Object >> unifyWithRealogEmployee: anEmployee usingUnifier: anUnifier [
	^ anUnifier forObject: self forObject: anEmployee
]
