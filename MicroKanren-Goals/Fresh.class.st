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

	^ (super onState: aState)
	  , (aState collectVars: (1 to: receiver numArgs) forFresh: self)
]

{ #category : #dispatched }
Fresh >> onState: aState withVars: aCollection [

	| g |
	variables
		ifNil: [ variables := aCollection ]
		ifNotNil: [ aCollection = variables ifFalse: [ Error signal ] ].
	g := receiver valueWithArguments: variables.
	^ g onState: aState
]

{ #category : #accessing }
Fresh >> variables [

	^ variables
]
