Class {
	#name : #UnificationError,
	#superclass : #Error,
	#instVars : [
		'left',
		'right'
	],
	#category : #MicroKanren
}

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

{ #category : #'as yet unclassified' }
UnificationError >> onState: aState bindings: anUnifier fromDisunite: aGoal [

	^ true asGoal onState: aState
]

{ #category : #'as yet unclassified' }
UnificationError >> onState: aState bindings: bindings fromUnify: aGoal [

	| extendedState |
	extendedState := aState failedBecauseOfUnificationError: self.
	^ false asGoal onState: extendedState
]

{ #category : #accessing }
UnificationError >> right [

	^ right
]

{ #category : #accessing }
UnificationError >> right: anObject [

	right := anObject
]
