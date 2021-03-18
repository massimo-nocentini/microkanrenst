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

{ #category : #dispatching }
UnificationError >> checkDisuniteAssociation: anAssociation constraint: aConstraint constraints: currentConstraintsLink on: newConstraintsLink bindings: bindings ifViolated: aBlock referenceState: aState [

	^ aState
		  checkDisuniteConstraints: currentConstraintsLink
		  on: newConstraintsLink
		  bindings: nil
		  ifViolated: aBlock
		  referenceState: aState
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
