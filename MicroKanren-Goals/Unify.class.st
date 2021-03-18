Class {
	#name : #Unify,
	#superclass : #Binary,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Unify >> beforeUnificationState: previousState afterUnificationState: aState deltaBindings: bindings [

	| aNewState |
	aNewState := aState == previousState
		             ifTrue: [ aState ]
		             ifFalse: [ 
			             aState checkDisuniteConstraintsIfViolated: [ 
				             :aFailureState | 
				             ^ false asGoal onState: aFailureState ] ].

	^ true asGoal onState: aNewState
]

{ #category : #running }
Unify >> beforeUnificationState: aState afterUnificationUnificationError: anError deltaBindings: bindings [

	| extendedState |
	extendedState := aState failedBecauseOfError: anError.
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
