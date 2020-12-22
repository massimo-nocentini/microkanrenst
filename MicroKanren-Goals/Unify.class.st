Class {
	#name : #Unify,
	#superclass : #Binary,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Unify >> onState: aState afterPushingGoal: aGoal [

	| aStateOrException |
	aStateOrException := Continuation currentDo: [ :k | 
		                     aState unifier
			                     continuation: k;
			                     value: left value: right ].
	^ aStateOrException onState: aState afterUnificationByUnify: self
]
