Class {
	#name : #Disj,
	#superclass : #Goal,
	#instVars : [
		'either',
		'or',
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

{ #category : #accessing }
Disj >> either [
	^ either
]

{ #category : #accessing }
Disj >> either: e [ 
	either := e
]

{ #category : #running }
Disj >> onState: aState [

	| path aStream anotherStream disjStream superStream |
	superStream := super onState: aState.
	path := aState path.
	aStream := either onState: aState.
	anotherStream := or onState: (aState
			                  path: path;
			                  yourself).
	disjStream := combineBlock value: aStream value: anotherStream.
	^ superStream , disjStream
]

{ #category : #accessing }
Disj >> or [
	^ or
]

{ #category : #accessing }
Disj >> or: o [ 
	or := o
]
