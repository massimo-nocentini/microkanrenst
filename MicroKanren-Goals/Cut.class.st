"
I am the cut of a goal (`cuttingGoal`): I take the first `length` states of its stream, or the given state when the stream is empty, and append them to what `super onState:` answers. `Goal>>!` makes me, with length 1, as the left part of a conjunction.

I send `ifEmpty:ifNotEmpty:` to the stream and `srfi41Singleton` to the state: no package of this project implements them.
"
Class {
	#name : #Cut,
	#superclass : #Goal,
	#instVars : [
		'cuttingGoal',
		'length'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
Cut >> cuttingGoal [

	^ cuttingGoal
]

{ #category : #accessing }
Cut >> cuttingGoal: anObject [

	cuttingGoal := anObject
]

{ #category : #accessing }
Cut >> length [

	^ length
]

{ #category : #accessing }
Cut >> length: anObject [

	length := anObject
]

{ #category : #running }
Cut >> onState: aState [

	| cuttingStream |
	cuttingStream := (cuttingGoal onState: aState)
		                 ifEmpty: [ aState srfi41Singleton ]
		                 ifNotEmpty: [ :aStream | aStream next: length ].
	^ (super onState: aState) , cuttingStream
]
