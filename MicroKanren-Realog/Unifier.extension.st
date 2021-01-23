Extension { #name : #Unifier }

{ #category : #'*MicroKanren-Realog' }
Unifier >> forRealogCompany: aCompany forRealogCompany: anotherCompany [
	^ self value: aCompany id value: anotherCompany id
]

{ #category : #'*MicroKanren-Realog' }
Unifier >> forRealogContract: aContract forRealogContract: anotherContract [

	^ #( id employee company type ) inject: state into: [ :s :each | 
		  s unifier
			  continuation: continuation;
			  value: (each value: aContract)
			  value: (each value: anotherContract) ]
]

{ #category : #'*MicroKanren-Realog' }
Unifier >> forRealogEmployee: anEmployee forRealogEmployee: anotherEmployee [

	^ self value: anEmployee id value: anotherEmployee id
]
