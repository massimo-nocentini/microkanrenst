Extension { #name : #BlockClosure }

{ #category : #'*MicroKanren-core' }
BlockClosure >> consedObject: car [

 ^ Chain item: car linker: self
]

{ #category : #'*MicroKanren-core' }
BlockClosure >> eta [
	^ Goal eta: self fresh
]

{ #category : #'*MicroKanren-core' }
BlockClosure >> fresh [
	^ Goal fresh: self
]
