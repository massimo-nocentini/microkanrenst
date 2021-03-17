Class {
	#name : #Unify,
	#superclass : #Binary,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Unify >> beforeUnificationState: previousState afterUnificationState: aState deltaBindings: bindings [

	"^ aState onState: previousState bindings: bindings fromUnify: self"

	| aNewState exitBlock |
	exitBlock := [ :aFailureState | 
	             ^ false asGoal onState: aFailureState ].

	aNewState := aState == previousState
		             ifTrue: [ aState ]
		             ifFalse: [ 
			             bindings associations
				             inject: self
				             into: [ :eachState :eachAssociation | 
					             | aCell aVar |
					             aVar := eachAssociation key.
					             aCell := eachState at: aVar.
					             aCell
						             ifDisuniteConstraintViolated: exitBlock
						             forVar: aVar
						             forUnify: self
						             fromState: eachState ] ].

	^ true asGoal onState: aNewState
]

{ #category : #running }
Unify >> beforeUnificationState: aState afterUnificationUnificationError: anError deltaBindings: bindings [

	| extendedState |
	extendedState := aState failedBecauseOfUnificationError: anError.
	^ false asGoal onState: extendedState
]

{ #category : #running }
Unify >> onState: aState afterPushingGoal: aGoal [

	| aStateOrException unifier bindings |
	bindings := Dictionary new.

	unifier := Unifier new
		           bindings: bindings;
		           state: aState;
		           yourself.

	aStateOrException := [ :k | 
	                     unifier
		                     continuation: k;
		                     value: left value: right ] valueWithExitUnary.

	^ aStateOrException
		  beforeUnificationState: aState
		  deltaBindings: bindings
		  fromUnify: self
]
