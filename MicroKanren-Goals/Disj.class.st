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

{ #category : #'as yet unclassified' }
Disj class >> appended [

	^ self new combineBlock: [ :aStream :anotherStream | 
		  aStream , anotherStream ]
]

{ #category : #'as yet unclassified' }
Disj class >> interleaved [

	^ self new combineBlock: [ :aStream :anotherStream | 
		  aStream | anotherStream ]
]

{ #category : #accessing }
Disj >> combine: anObject [
	combineBlock := anObject
]

{ #category : #accessing }
Disj >> combineBlock: aBlock [

	combineBlock := aBlock
]

{ #category : #accessing }
Disj >> either: e [ 
	either := e
]

{ #category : #running }
Disj >> onState: aState [

	| path aStream anotherStream |
	path := aState path.
	aStream := either onState: aState.
	anotherStream := or onState: (aState
			                  path: path;
			                  yourself).
	^ combineBlock value: aStream value: anotherStream
]

{ #category : #accessing }
Disj >> or: o [ 
	or := o
]

{ #category : #printing }
Disj >> printOn: aStream [
	aStream nextPut: $(.
	either printOn: aStream.
	aStream nextPutAll: ') v° ('.
	or printOn: aStream.
	aStream nextPut: $)
]
