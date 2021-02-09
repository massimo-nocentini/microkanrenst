Class {
	#name : #MKGoalInspect,
	#superclass : #Atomic,
	#instVars : [
		'block'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
MKGoalInspect >> blockClosure: anObject [

	block := anObject
]

{ #category : #running }
MKGoalInspect >> onState: aState [

	block value: aState.

	^ super onState: aState
]
