Class {
	#name : #Disj,
	#superclass : #Binary,
	#instVars : [
		'combineBlock'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #creating }
Disj class >> appended [

	^ self new combineBlock: [ :aStream :anotherStream | 
		  aStream , anotherStream ]
]

{ #category : #creating }
Disj class >> interleaved [

	^ self new combineBlock: [ :aStream :anotherStream | 
		  aStream + anotherStream ]
]

{ #category : #accessing }
Disj >> combineBlock: aBlock [

	combineBlock := aBlock
]

{ #category : #running }
Disj >> onState: aState afterPushingGoal: _ [

	| aStream anotherStream |
	aStream := left onState: aState.
	anotherStream := right onState: aState.
	^ aStream appendStream: anotherStream
]
