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
	cuttingStream := cuttingGoal onState: aState.
	^ (super onState: aState) , (cuttingStream next: length)
]
