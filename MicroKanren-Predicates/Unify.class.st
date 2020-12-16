Class {
	#name : #Unify,
	#superclass : #PredicateBinary,
	#category : #'MicroKanren-Predicates'
}

{ #category : #accessing }
Unify >> name [

	^ '=°'
]

{ #category : #running }
Unify >> onState: aState [

	| extendedState |
	aState pushGoal: self copy.
	^ [ 
	  extendedState := aState unifier
		                   value: firstArgument
		                   value: secondArgument.
	  true asGoal onState: extendedState ]
		  on: UnificationError
		  do: [ :e | 
			  extendedState := aState failedBecauseOfUnificationError: e.
			false asGoal onState: extendedState "
			  (Disequality value: e left value: e right) onState: extendedState" ]
]
