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
			  extendedState := aState failedBecauseOfUnificationError: error.
			  false asGoal onState: extendedState ]
		  ifFalse: [ 
			  | aNewState |
			  aNewState := bindings associations
				               inject: previousState
				               into: [ :eachState :eachAssociation | 
					               eachState
						               at: eachAssociation key
						               update: [ :aCell | 
						               aCell disunited: eachAssociation value ] ].
			  true asGoal onState: aNewState ]
]

{ #category : #running }
Disunite >> beforeUnificationState: aState afterUnificationUnificationError: anError deltaBindings: bindings [

	^ true asGoal onState: aState
]
