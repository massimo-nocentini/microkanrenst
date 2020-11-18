Extension { #name : #Unifier }

{ #category : #'*MicroKanren-Realog' }
Unifier >> forRealogCompany: aCompany forRealogCompany: anotherCompany [
	^ self value: aCompany id value: anotherCompany id
]

{ #category : #'*MicroKanren-Realog' }
Unifier >> forRealogContract: aContract forRealogContract: anotherContract [
	| refinedState |
	refinedState := self value: aContract id value: anotherContract id.
	refinedState := refinedState unifier
		                value: aContract employee
		                value: anotherContract employee.
	refinedState := refinedState unifier
		                value: aContract company
		                value: anotherContract company.
	refinedState := refinedState unifier
		                value: aContract type
		                value: anotherContract type.
	^ refinedState
]

{ #category : #'*MicroKanren-Realog' }
Unifier >> forRealogEmployee: anEmployee forRealogEmployee: anotherEmployee [
	^ self value: anEmployee id value: anotherEmployee id
]
