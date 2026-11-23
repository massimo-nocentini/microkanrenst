"
I am the negation of a goal (`cuttingGoal`): I run it on the given state, and succeed there if its stream is empty, or fail if it is not. `Goal>>not` makes me.

I send `ifEmpty:ifNotEmpty:` to the stream, which no package of this project implements.
"
Class {
	#name : #Not,
	#superclass : #Goal,
	#instVars : [
		'cuttingGoal'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
Not >> cuttingGoal [

	^ cuttingGoal
]

{ #category : #accessing }
Not >> cuttingGoal: anObject [

	cuttingGoal := anObject
]

{ #category : #running }
Not >> onState: aState [

	^ ((cuttingGoal onState: aState)
		   ifEmpty: [ true asGoal ]
		   ifNotEmpty: [ false asGoal ]) onState: aState
]
