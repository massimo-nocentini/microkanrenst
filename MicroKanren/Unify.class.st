Class {
	#name : #Unify,
	#superclass : #Goal,
	#instVars : [
		'this',
		'that'
	],
	#category : 'MicroKanren-core'
}

{ #category : #running }
Unify >> onState: aState [
	^ [ | extended_state |
	extended_state := Unifier new unify: this with: that onState: aState.
	Goal succeed onState: extended_state ]
		on: UnificationError
		do: [ Goal fail onState: aState ]
]

{ #category : #accessing }
Unify >> that: anObj [
	that := anObj
]

{ #category : #accessing }
Unify >> this: anObj [
	this := anObj
]
