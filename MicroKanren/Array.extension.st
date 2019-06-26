Extension { #name : #Array }

{ #category : #'*MicroKanren-core' }
Array >> reifyUsingReifier: aReifier [
	^ aReifier forArray: self 
]

{ #category : #'*MicroKanren-core' }
Array >> unifyWith: another usingUnifier: anUnifier [
	^ another unifyWithArray: self usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-core' }
Array >> unifyWithArray: aCollection usingUnifier: anUnifier [ 
	^ anUnifier forArray: self forArray: aCollection
]

{ #category : #'*MicroKanren-core' }
Array >> walkStarUsingWalker: aWalker [
	^ aWalker forArray: self
]
