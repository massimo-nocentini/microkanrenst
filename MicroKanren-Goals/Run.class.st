"
I run a `goal` and turn the states it answers into answers: I discard those that are not sound, and reify the variables of the goal in the others. An answer is an object when the goal has one variable, a collection when it has more, and `#tautology` when it has none. `Goal>>solutions` makes me.
"
Class {
	#name : #Run,
	#superclass : #Goal,
	#instVars : [
		'goal'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
Run >> goal: aGoal [
	goal := aGoal
]

{ #category : #'as yet unclassified' }
Run >> onState: aState [

	| aStream vars selector |
	aStream := goal onState: aState.
	vars := goal variables ifEmpty: [ { Var tautology } ].
	selector := vars size = 1
		            ifTrue: [ #first ]
		            ifFalse: [ #yourself ].
	^ (aStream select: [ :each | each isSound ]) collect: [ :s | 
		  selector value: (s reifier reifyVars: vars) ]
]
