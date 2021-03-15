Class {
	#name : #Disunite,
	#superclass : #Unify,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Disunite >> onState: aState unificationResult: aStateOrException bindings: bindings [

	^ aStateOrException
		  onState: aState
		  unificationBy: bindings
		  fromDisunite: self
]

{ #category : #printing }
Disunite >> printOn: aStream renderer: aRenderer [

	self shouldBeImplemented
]
