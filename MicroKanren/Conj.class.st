Class {
	#name : #Conj,
	#superclass : #GoalWithChainCombinationStrategy,
	#instVars : [
		'both',
		'and'
	],
	#category : #MicroKanren
}

{ #category : #accessing }
Conj >> and: anotherGoal [ 
	and := anotherGoal
]

{ #category : #accessing }
Conj >> both: aGoal [ 
	both := aGoal
]

{ #category : #running }
Conj >> onState: aState [ 
	| combinator |
	combinator := [both onState: aState] suspended
				bind: [:anotherState | and onState: anotherState].
	^ chainCombinationStrategy of: combinator
]
