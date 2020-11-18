Extension { #name : #Reifier }

{ #category : #'*MicroKanren-Realog' }
Reifier >> forRealogCompany: aCompany [
	^ self value: aCompany id
]

{ #category : #'*MicroKanren-Realog' }
Reifier >> forRealogContract: aContract [
	| refinedState reifier |
	reifier := self class new
		           state: state;
		           yourself.
	refinedState := reifier value: aContract id.
	reifier state: refinedState.
	refinedState := reifier value: aContract employee.
	reifier state: refinedState.
	refinedState := reifier value: aContract company.
	reifier state: refinedState.
	refinedState := reifier value: aContract type.
	^ refinedState
]

{ #category : #'*MicroKanren-Realog' }
Reifier >> forRealogEmployee: anEmployee [
	^ self value: anEmployee id
]
