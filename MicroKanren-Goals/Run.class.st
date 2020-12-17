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
