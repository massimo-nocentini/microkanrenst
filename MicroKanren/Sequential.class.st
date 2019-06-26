Class {
	#name : #Sequential,
	#superclass : #ChainCombinationStrategy,
	#category : 'MicroKanren-chains'
}

{ #category : #dispatching }
Sequential >> of: aStreamCombination [
	^ aStreamCombination sequentialStrategy: self
]
