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

	| aStream anotherStream disjStream superStream |
	superStream := super onState: aState afterPushingGoal: _.
	aStream := left onState: aState.
	anotherStream := right onState: aState.
	disjStream := combineBlock value: aStream value: anotherStream.
	^ superStream , disjStream
]
