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
