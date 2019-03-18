Class {
	#name : #StreamCombinationStrategy,
	#superclass : #Object,
	#category : 'MicroKanren-core'
}

{ #category : #dispatching }
StreamCombinationStrategy >> of: aStreamCombination [
	self subclassResponsibility
]
