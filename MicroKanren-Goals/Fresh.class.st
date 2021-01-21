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

	^ aState collectVars: receiver argumentNames forFresh: self
]

{ #category : #dispatched }
Fresh >> onState: aState withVars: aCollection [

	variables := aCollection.
	nestedGoal := receiver valueWithArguments: self variables.
	^ super onState: aState
]

{ #category : #accessing }
Fresh >> variables [

	^ variables
]
