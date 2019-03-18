Class {
	#name : #Fresh,
	#superclass : #Goal,
	#instVars : [
		'receiver',
		'vars'
	],
	#category : 'MicroKanren-core'
}

{ #category : #running }
Fresh >> onState: aState [
	^ aState collectVars: (1 to: receiver numArgs) forFresh: self
]

{ #category : #dispatched }
Fresh >> onState: aState withVars: aCollection [
	| g |
	vars := aCollection.
	g := receiver valueWithArguments: vars.
	^ g onState: aState
]

{ #category : #accessing }
Fresh >> receiver: aBlockClosure [
	receiver := aBlockClosure
]

{ #category : #reification }
Fresh >> vars [
	^ vars
]
