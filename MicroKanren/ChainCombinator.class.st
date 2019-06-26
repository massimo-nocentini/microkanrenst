Class {
	#name : #ChainCombinator,
	#superclass : #Object,
	#category : 'MicroKanren-chains'
}

{ #category : #dispatched }
ChainCombinator >> interleavedStrategy: anInterleaved [
	self subclassResponsibility
]

{ #category : #dispatched }
ChainCombinator >> sequentialStrategy: aSequential [
	self subclassResponsibility
]
