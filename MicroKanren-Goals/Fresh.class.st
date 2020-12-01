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
		ifNotNil: [ "aCollection = variables ifFalse: [ Error signal ] " 
		Error signal ].
	nestedGoal
		ifNil: [ nestedGoal := receiver valueWithArguments: self variables ]
		ifNotNil: [ Error signal ].
	"g := receiver valueWithArguments: variables."
	^ (super onState: aState) , (nestedGoal onState: aState)
]

{ #category : #accessing }
Fresh >> variables [

	^ variables
]

{ #category : #accessing }
Fresh >> variables: aCollection [

	variables := aCollection
]
