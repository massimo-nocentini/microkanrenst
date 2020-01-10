Extension { #name : #SBRAL }

{ #category : #'*MicroKanren' }
SBRAL >> asState [
	^ State fromSBRAL: self
]

{ #category : #'*MicroKanren' }
SBRAL >> walk: aVar fromState: aState [
	^ aState walk: aVar inSBRAL: self
]
