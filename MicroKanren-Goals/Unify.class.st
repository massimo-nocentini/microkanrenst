Class {
	#name : #Unify,
	#superclass : #Binary,
	#category : #'MicroKanren-Goals'
}

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

	^ self
		  onState: aState
		  unificationResult: aStateOrException
		  bindings: bindings
]

{ #category : #running }
Unify >> onState: aState unificationResult: aStateOrException bindings: bindings [

	^ aStateOrException
		  onState: aState
		  bindings: bindings
		  fromUnify: self
]
