Class {
	#name : #AlphaRule,
	#superclass : #Goal,
	#instVars : [
		'x',
		'y'
	],
	#category : #MicroKanren
}

{ #category : #running }
AlphaRule >> onState: aState [
	^ [ (x isAlphaEquivalentTo: y inState: aState) asGoal onState: aState ]
		srfi41Stream
]

{ #category : #accessing }
AlphaRule >> x: anObj [
	x := anObj
]

{ #category : #accessing }
AlphaRule >> y: anObj [
	y := anObj
]
