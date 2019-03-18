Class {
	#name : #IfPure,
	#superclass : #If,
	#instVars : [
		'streamCombinationStrategy'
	],
	#category : 'MicroKanren-core'
}

{ #category : #running }
IfPure >> onState: aState [
	| alpha beta |
	alpha := question , answer onState: aState.
	beta := [ otherwise onState: aState ].
	^ streamCombinationStrategy of: (alpha mplus: beta)
]

{ #category : #initializing }
IfPure >> streamCombinationStrategy: aStrategy [
	streamCombinationStrategy := aStrategy
]
