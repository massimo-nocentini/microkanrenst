Extension { #name : #Reifier }

{ #category : #'*MicroKanren-Realog' }
Reifier >> forRealogCompany: aCompany [
	^ self value: aCompany id
]

{ #category : #'*MicroKanren-Realog' }
Reifier >> forRealogContract: aContract [
	^ #( id employee company type )
		  inject: state
		  into: [ :s :aSelector | 
			  self class new
				  state: s;
				  value: (aSelector value: aContract) ]
]

{ #category : #'*MicroKanren-Realog' }
Reifier >> forRealogEmployee: anEmployee [
	^ self value: anEmployee id
]
