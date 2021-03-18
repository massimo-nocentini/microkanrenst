Class {
	#name : #Unify,
	#superclass : #Binary,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Unify >> beforeUnificationState: previousState afterUnificationState: aState deltaBindings: bindings [

	| aNewState exitBlock |
	exitBlock := [ :aFailureState | 
	             ^ false asGoal onState: aFailureState ].

	aNewState := aState == previousState
		             ifTrue: [ aState ]
		             ifFalse: [ 
			             bindings associations
				             inject: aState
				             into: [ :eachState :eachAssociation | 
					             | aCell aVar |
					             aVar := eachAssociation key.
					             aCell := eachState at: aVar.
					eachState
					          "   aCell
						             ifDisuniteConstraintViolated: exitBlock
						             forVar: aVar
						             forUnify: self
						             fromState: eachState" ] ].

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

	| aStateOrException bindings |
	"Prepare the dictionary to hold new bindings occurring in the current unification process."
	bindings := Dictionary new.

	"Perform unification."
	aStateOrException := Unifier new
		                     onState: aState
		                     unify: left
		                     and: right
		                     bindings: bindings.

	"Then dispatch over the resulting object."
	^ aStateOrException
		  beforeUnificationState: aState
		  deltaBindings: bindings
		  dispatchOver: self
]
