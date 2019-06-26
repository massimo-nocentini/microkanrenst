Class {
	#name : #ChainCombinationStrategy,
	#superclass : #Object,
	#category : 'MicroKanren-chains'
}

{ #category : #dispatching }
ChainCombinationStrategy >> of: aStreamCombination [
	self subclassResponsibility
]
