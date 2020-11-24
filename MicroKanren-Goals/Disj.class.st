Class {
	#name : #Disj,
	#superclass : #Goal,
	#instVars : [
		'either',
		'or'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
Disj >> either: e [ 
	either := e
]

{ #category : #running }
Disj >> onState: aState [
	| path |
	path := aState path.
	^ (either onState: aState) + (or onState: (aState
			    path: path;
			    yourself))
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
