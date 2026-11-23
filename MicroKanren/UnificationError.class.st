"
I tell that `left` and `right` cannot be unified, with the reason as message text (by default they are different objects).

I am an `Error`, but `Unifier` does not signal me: it passes me to its continuation, and `Unify` sends me `onState:afterUnificationByUnify:`, which runs a `Failed` goal on a `FailedState` that keeps me as counterexample.
"
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

{ #category : #accessing }
UnificationError >> left [

	^ left
]

{ #category : #accessing }
UnificationError >> left: anObject [

	left := anObject
]

{ #category : #'as yet unclassified' }
UnificationError >> onState: aState afterUnificationByUnify: aGoal [

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
