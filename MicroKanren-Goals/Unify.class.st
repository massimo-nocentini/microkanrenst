Class {
	#name : #Unify,
	#superclass : #Goal,
	#instVars : [
		'this',
		'that'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Unify >> onState: aState [
	^ (super onState: aState) , ([ 
	   | extended_state |
	   extended_state := aState unifier value: this value: that.
	   true asGoal onState: extended_state ]
		   on: UnificationError
		   do: [ false asGoal onState: aState ])
]

{ #category : #accessing }
Unify >> that [
	^ that
]

{ #category : #accessing }
Unify >> that: anObj [
	that := anObj
]

{ #category : #accessing }
Unify >> this [
	^ this
]

{ #category : #accessing }
Unify >> this: anObj [
	this := anObj
]
