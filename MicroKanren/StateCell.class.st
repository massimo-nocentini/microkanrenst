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

	| aNewState |
	aNewState := disunite reversed asLinkedList
		             inject: aState
		             into: [ :previousState :eachValue | 
			             | bindings aNewStateOrError |
			             self halt.
			             self assert: (aState instVarNamed: #substitution)
				             = (previousState instVarNamed: #substitution).
			             bindings := Dictionary new.
			             aNewStateOrError := [ :k | 
			                                 Unifier new
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
					             failingState := previousState 
						                             failedBecauseOfUnificationError:
						                             error.
					             aBlock value: failingState ]
				             ifFalse: [ 
					             aNewStateOrError
						             disuniteConstraintSatisfied: bindings
						             previousState: previousState ] ].

	^ aNewState at: aVar update: [ :aCell | aCell emptyDisunite ]
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
