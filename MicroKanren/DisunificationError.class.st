Class {
	#name : #DisunificationError,
	#superclass : #UnificationError,
	#category : #MicroKanren
}

{ #category : #'as yet unclassified' }
DisunificationError >> beforeUnificationState: aState deltaBindings: bindings dispatchOver: aGoal [

	self shouldNotImplement
]

{ #category : #dispatching }
DisunificationError >> checkDisuniteAssociation: anAssociation constraint: aConstraint constraints: currentConstraintsLink on: newConstraintsLink bindings: bindings ifViolated: aBlock referenceState: aState [

	self shouldNotImplement
]

{ #category : #accessing }
DisunificationError >> description [

	^ String streamContents: [ :aStream | 
		  left printOn: aStream.
		  aStream nextPutAll: ' cannot be disunited with '.
		  right printOn: aStream.
		  aStream
			  nextPutAll: ' because ';
			  nextPutAll:
				  (self messageText ifEmpty: [ 'they are equal objects' ]) ]
]

{ #category : #printing }
DisunificationError >> printOn: aStream renderer: aRenderer [

	left printOn: aStream.
	aStream nextPutAll: ' = '.
	right printOn: aStream
]
