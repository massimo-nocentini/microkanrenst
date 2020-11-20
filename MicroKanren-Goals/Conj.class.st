Class {
	#name : #Conj,
	#superclass : #Goal,
	#instVars : [
		'both',
		'and'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
Conj >> and: anotherGoal [ 
	and := anotherGoal
]

{ #category : #accessing }
Conj >> both: aGoal [ 
	both := aGoal
]

{ #category : #running }
Conj >> onState: aState [
	^ [ :refinedState | 
	  refinedState path
		  ifNil: [ Error signal: 'Not expected' ]
		  ifNotNil: [ :path | refinedState path: path nextLink ].
	  and onState: refinedState ] >>= (both onState: aState)
]

{ #category : #printing }
Conj >> printOn: aStream [
	aStream nextPut: $(.
	both printOn: aStream.
	aStream nextPutAll: ') ,° ('.
	and printOn: aStream.
	aStream nextPut: $)
]
