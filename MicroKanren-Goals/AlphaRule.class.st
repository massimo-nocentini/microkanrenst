Class {
	#name : #AlphaRule,
	#superclass : #Goal,
	#instVars : [
		'x',
		'y'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
AlphaRule >> onState: aState [

	^ [ 
	  (x isAlphaEquivalentTo: y inState: aState) asGoal onState: aState ]
]

{ #category : #accessing }
AlphaRule >> x: anObj [
	x := anObj
]

{ #category : #accessing }
AlphaRule >> y: anObj [
	y := anObj
]
