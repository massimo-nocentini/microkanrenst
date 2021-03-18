Class {
	#name : #UnificationError,
	#superclass : #Error,
	#instVars : [
		'left',
		'right'
	],
	#category : #MicroKanren
}

{ #category : #'as yet unclassified' }
UnificationError >> beforeUnificationState: aState deltaBindings: bindings dispatchOver: aGoal [

	^ aGoal
		  beforeUnificationState: aState
		  afterUnificationUnificationError: self
		  deltaBindings: bindings
]

{ #category : #accessing }
UnificationError >> description [

	^ String streamContents: [ :aStream | 
		  left printOn: aStream.
		  aStream nextPutAll: ' cannot be unified with '.
		  right printOn: aStream.
		  aStream
			  nextPutAll: ' because ';
			  nextPutAll:
				  (self messageText ifEmpty: [ 'they are different objects' ]) ]
]

{ #category : #'as yet unclassified' }
UnificationError >> disuniteConstraintSatisfied: bindings previousState: previousState [

	self assert: bindings isEmpty.
	^ previousState
]

{ #category : #accessing }
UnificationError >> left [

	^ left
]

{ #category : #accessing }
UnificationError >> left: anObject [

	left := anObject
]

{ #category : #printing }
UnificationError >> printOn: aStream renderer: aRenderer [

	left printOn: aStream.
	aStream nextPutAll: ' ≠ '.
	right printOn: aStream
]

{ #category : #accessing }
UnificationError >> right [

	^ right
]

{ #category : #accessing }
UnificationError >> right: anObject [

	right := anObject
]
