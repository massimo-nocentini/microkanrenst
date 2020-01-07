Class {
	#name : #GoalWithChainCombinationStrategy,
	#superclass : #Goal,
	#instVars : [
		'chainCombinationStrategy'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #'as yet unclassified' }
GoalWithChainCombinationStrategy >> chainCombinationStrategy: aStrategy [ 
	chainCombinationStrategy := aStrategy
]
