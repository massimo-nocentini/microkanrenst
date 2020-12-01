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
Conj >> and [
	^ and
]

{ #category : #accessing }
Conj >> and: anotherGoal [ 
	and := anotherGoal
]

{ #category : #accessing }
Conj >> both [
	^ both
]

{ #category : #accessing }
Conj >> both: aGoal [ 
	both := aGoal
]

{ #category : #running }
Conj >> onState: aState [

	| boundStream |
	boundStream := [ :refinedState | 
	               refinedState path
		               ifNil: [ Error signal: 'Not expected' ]
		               ifNotNil: [ :path | 
			               ({ 
				                Succeed.
				                Failed } includes: path value class) ifTrue: [ 
				               refinedState path: path nextLink ] ].
	               and onState: refinedState ] >>= (both onState: aState).
	^ (super onState: aState) , boundStream
]
