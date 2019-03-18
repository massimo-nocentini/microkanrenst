Extension { #name : #Array }

{ #category : #'*MicroKanren-core' }
Array >> reifyUsing: aReifier [
	^ aReifier reifyArray: self 
]

{ #category : #'*MicroKanren-core' }
Array >> walkStarUsingWalker: aWalker [
	^ aWalker walkStarArray: self
]
