Class {
	#name : #Sequential,
	#superclass : #StreamCombinationStrategy,
	#category : 'MicroKanren-core'
}

{ #category : #dispatching }
Sequential >> of: aStreamCombination [
	^ aStreamCombination sequentialStrategy: self
]
