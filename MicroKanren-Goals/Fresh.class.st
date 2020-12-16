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

{ #category : #dispatched }
Fresh >> onState: aState withVars: aCollection [

	variables
		ifNil: [ self variables: aCollection ]
		ifNotNil: [ Error signal ].
	nestedGoal
		ifNil: [ nestedGoal := receiver valueWithArguments: self variables ]
		ifNotNil: [ Error signal ].
	^ (super onState: aState)
	  , [ nestedGoal onState: aState ] srfi41Stream
]

{ #category : #accessing }
Fresh >> variables [

	^ variables
]

{ #category : #accessing }
Fresh >> variables: aCollection [

	variables := aCollection
]
