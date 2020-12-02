Class {
	#name : #Cut,
	#superclass : #Goal,
	#instVars : [
		'cuttingGoal',
		'restGoal',
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

	| cuttingStream initStream |
	cuttingStream := cuttingGoal onState: aState.
	initStream := (super onState: aState) , (cuttingStream next: length).
	^ [ :cutState | restGoal onState: cutState ] >>= initStream
]

{ #category : #accessing }
Cut >> restGoal [

	^ restGoal
]

{ #category : #accessing }
Cut >> restGoal: anObject [

	restGoal := anObject
]
