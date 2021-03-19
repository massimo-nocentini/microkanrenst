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

	| aStream vars selector reifier |
	aStream := goal onState: aState.
	vars := goal variables ifEmpty: [ { Var tautology } ].
	selector := vars size = 1
		            ifTrue: [ #first ]
		            ifFalse: [ #yourself ].
	reifier := Reifier new.
	^ (aStream select: [ :each | each isSound ]) collect: [ :eachState | 
		  | reifiedVars |
		  reifiedVars := reifier
			                 state: eachState;
			                 reifyVars: vars.
		  reifiedVars perform: selector ]
]
