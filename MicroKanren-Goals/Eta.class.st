Class {
	#name : #Eta,
	#superclass : #Suspended,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Eta >> onState: aState [

	nestedGoal
		ifNil: [ nestedGoal := receiver valueWithArguments: self variables ]
		ifNotNil: [ Error signal ].
	^ (super onState: aState)
	  , [ nestedGoal onState: aState ] srfi41Stream
]
