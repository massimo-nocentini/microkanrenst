Class {
	#name : #Unify,
	#superclass : #Binary,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Unify >> onState: aState afterPushingGoal: aGoal [

	| extendedState superStream unifiedStream |
	superStream := super onState: aState afterPushingGoal: aGoal.
	unifiedStream := [ 
	                 extendedState := aState unifier
		                                  value: left
		                                  value: right.
	                 true asGoal onState: extendedState ]
		                 on: UnificationError
		                 do: [ :e | 
			                 extendedState := aState 
				                                  failedBecauseOfUnificationError:
				                                  e.
			                 false asGoal onState: extendedState ].
	^ superStream , unifiedStream
]
