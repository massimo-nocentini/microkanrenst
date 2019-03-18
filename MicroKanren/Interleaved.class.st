Class {
	#name : #Interleaved,
	#superclass : #StreamCombinationStrategy,
	#category : 'MicroKanren-core'
}

{ #category : #dispatching }
Interleaved >> of: aStreamCombination [
	^ aStreamCombination interleavedStrategy: self
]
