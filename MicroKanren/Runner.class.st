Class {
	#name : #Runner,
	#superclass : #Object,
	#instVars : [
		'goal'
	],
	#category : 'MicroKanren-core'
}

{ #category : #creating }
Runner class >> onGoal: aGoal [
	^ self new
		goal: aGoal;
		yourself
]

{ #category : #selecting }
Runner >> all [
 ^ self run contents
]

{ #category : #selecting }
Runner >> atMost: anInteger [ 
	^ (self run next: anInteger) contents
]

{ #category : #accessing }
Runner >> goal: aGoal [
	goal := aGoal
]

{ #category : #reification }
Runner >> run [
	| states vars selector |
	states := goal onState: Dictionary new asState.
	vars := goal vars
				ifEmpty: [LinkedList with: Var tautology].
	selector := vars size = 1
				ifTrue: [#first]
				ifFalse: [#yourself].
	^ states
		collect: [:s | selector
				value: (s reifier reifyVars: vars)]
]
