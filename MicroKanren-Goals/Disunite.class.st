Class {
	#name : #Disunite,
	#superclass : #Binary,
	#category : #'MicroKanren-Goals'
}

{ #category : #'as yet unclassified' }
Disunite >> onState: aState afterPushingGoal: aGoal [

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
		  onState: aState
		  unificationBy: bindings
		  fromDisunite: self
]

{ #category : #printing }
Disunite >> printOn: aStream renderer: aRenderer [

	self shouldBeImplemented
]
