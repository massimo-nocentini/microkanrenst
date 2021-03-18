Class {
	#name : #Disunite,
	#superclass : #Unify,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Disunite >> beforeUnificationState: previousState afterUnificationState: aState deltaBindings: bindings [

	^ previousState == aState
		  ifTrue: [ 
			  | extendedState error |
			  error := DisunificationError new
				           left: left;
				           right: right;
				           yourself.
			  extendedState := aState failedBecauseOfError: error.
			  false asGoal onState: extendedState ]
		  ifFalse: [ 
			  | aNewState |
			  aNewState := previousState addDisuniteConstraintAdaptingBindings:
				               bindings.
			  true asGoal onState: aNewState ]
]

{ #category : #running }
Disunite >> beforeUnificationState: aState afterUnificationUnificationError: anError deltaBindings: bindings [

	^ true asGoal onState: aState
]
