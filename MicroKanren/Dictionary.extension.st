Extension { #name : #Dictionary }

{ #category : #'*MicroKanren-core' }
Dictionary >> asState [
	^ State fromDictionary: self
]

{ #category : #'*MicroKanren-core' }
Dictionary >> walk: anObj fromState: aState [
	^ aState walk: anObj inDictionary: self
]
