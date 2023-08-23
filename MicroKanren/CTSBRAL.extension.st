Extension { #name : #CTSBRAL }

{ #category : #'*MicroKanren' }
CTSBRAL >> asState [

	^ State fromSBRAL: self
]

{ #category : #'*MicroKanren' }
CTSBRAL >> walk: aVar fromState: aState [

	^ aState walk: aVar inSBRAL: self
]
