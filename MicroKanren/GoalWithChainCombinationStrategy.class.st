Class {
	#name : #GoalWithChainCombinationStrategy,
	#superclass : #Goal,
	#instVars : [
		'chainCombinationStrategy'
	],
	#category : 'MicroKanren-core'
}

{ #category : #'as yet unclassified' }
GoalWithChainCombinationStrategy >> chainCombinationStrategy: aStrategy [ 
	chainCombinationStrategy := aStrategy
]
