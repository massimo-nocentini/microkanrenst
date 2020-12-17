Class {
	#name : #Fresh,
	#superclass : #Suspended,
	#instVars : [
		'variables'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Fresh >> onState: aState [

	^ aState collectVars: (1 to: receiver numArgs) forFresh: self
]

{ #category : #running }
Fresh >> onState: aState afterPushingGoal: _ [

	^ (super onState: aState afterPushingGoal: _)
	  , [ nestedGoal onState: aState ] srfi41Stream
]

{ #category : #dispatched }
Fresh >> onState: aState withVars: aCollection [

	variables
		ifNil: [ variables := aCollection ]
		ifNotNil: [ Error signal ].
	nestedGoal
		ifNil: [ nestedGoal := receiver valueWithArguments: self variables ]
		ifNotNil: [ Error signal ].
	^ super onState: aState
]

{ #category : #accessing }
Fresh >> variables [

	^ variables
]
