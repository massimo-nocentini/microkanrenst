Class {
	#name : #Unify,
	#superclass : #Binary,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Unify >> onState: aState afterPushingGoal: aGoal [

	| aStateOrException |
	aStateOrException := [ :k | 
	                     aState unifier
		                     continuation: k;
		                     value: left value: right ] valueWithExitUnary.
	^ aStateOrException onState: aState afterUnificationByUnify: self
]
