Class {
	#name : #Disunite,
	#superclass : #Binary,
	#category : #'MicroKanren-Goals'
}

{ #category : #'as yet unclassified' }
Disunite >> onState: aState afterPushingGoal: aGoal [

	| aStateOrException |
	aStateOrException := [ :k | 
	                     aState unifier
		                     continuation: k;
		                     value: left value: right ] valueWithExitUnary.

	^ aStateOrException onState: aState afterUnificationByDisunite: self
]

{ #category : #printing }
Disunite >> printOn: aStream renderer: aRenderer [

	aRenderer printOn: aStream aDisunite: self
]
