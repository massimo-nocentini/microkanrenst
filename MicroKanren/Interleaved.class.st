Class {
	#name : #Interleaved,
	#superclass : #ChainCombinationStrategy,
	#category : 'MicroKanren-chains'
}

{ #category : #dispatching }
Interleaved >> of: aStreamCombination [
	^ aStreamCombination interleavedStrategy: self
]
