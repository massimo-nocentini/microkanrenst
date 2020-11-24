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
	| states vars selector |
	states := goal onState: aState.
	vars := goal variables ifEmpty: [ LinkedList with: Var tautology ].
	selector := vars size = 1
		            ifTrue: #first
		            ifFalse: #yourself.
	^ states collect: [ :s | selector value: (s reifier reifyVars: vars) ]
]
