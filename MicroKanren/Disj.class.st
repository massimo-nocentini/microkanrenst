Class {
	#name : #Disj,
	#superclass : #GoalWithChainCombinationStrategy,
	#instVars : [
		'either',
		'or'
	],
	#category : 'MicroKanren-core'
}

{ #category : #accessing }
Disj >> either: e [ 
	either := e
]

{ #category : #running }
Disj >> onState: aState [ 
	| combinator |
	combinator := [either onState: aState] suspended
				mplus: [or onState: aState].
	^ chainCombinationStrategy of: combinator
]

{ #category : #accessing }
Disj >> or: o [ 
	or := o
]
