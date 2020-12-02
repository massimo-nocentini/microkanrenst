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
