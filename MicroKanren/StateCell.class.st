Class {
	#name : #StateCell,
	#superclass : #Object,
	#instVars : [
		'unify',
		'disunite'
	],
	#category : #MicroKanren
}

{ #category : #'as yet unclassified' }
StateCell >> disunited [

	^ disunite
]

{ #category : #'as yet unclassified' }
StateCell >> disunited: anObject [

	^ self copy
		  instVarNamed: #disunite put: anObject ~~> disunite;
		  yourself
]

{ #category : #'as yet unclassified' }
StateCell >> emptyDisunite [

	^ self copy
		  instVarNamed: #disunite put: nil;
		  yourself
]

{ #category : #'as yet unclassified' }
StateCell >> ifDisuniteConstraintViolated: aBlock forVar: aVar forUnify: aGoal fromState: aState [

	| unifier |
	unifier := Unifier new.

	^ disunite reversed asLinkedList
		  inject: aState
		  into: [ :previousState :eachValue | 
			  | bindings aNewStateOrError |
			  bindings := Dictionary new.
			  aNewStateOrError := [ :k | 
			                      unifier
				                      continuation: k;
				                      state: previousState;
				                      bindings: bindings;
				                      value: aVar value: eachValue ]
				                      valueWithExitUnary.

			  aNewStateOrError == previousState
				  ifTrue: [ 
					  | error failingState |
					  error := DisunificationError new
						           left: aVar;
						           right: eachValue;
						           yourself.
					  failingState := previousState failedBecauseOfUnificationError:
						                  error.
					  aBlock value: failingState ]
				  ifFalse: [ 
					  aNewStateOrError
						  disuniteConstraintSatisfied: bindings
						  previousState: previousState ] ]
]

{ #category : #initialization }
StateCell >> initialize [

	super initialize.
	unify := Maybe nothing.
	disunite := nil
]

{ #category : #'as yet unclassified' }
StateCell >> unified [

	^ unify
]

{ #category : #'as yet unclassified' }
StateCell >> unified: anObject [

	^ self copy
		  instVarNamed: #unify put: (Maybe just: anObject);
		  yourself
]
