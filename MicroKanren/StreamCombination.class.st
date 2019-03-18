Class {
	#name : #StreamCombination,
	#superclass : #Object,
	#category : 'MicroKanren-core'
}

{ #category : #dispatched }
StreamCombination >> interleavedStrategy: anInterleaved [
	self subclassResponsibility
]

{ #category : #dispatched }
StreamCombination >> sequentialStrategy: aSequential [
	self subclassResponsibility
]
