Class {
	#name : #Fresh,
	#superclass : #Goal,
	#instVars : [
		'receiver'
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
	variables := aCollection.
	g := receiver valueWithArguments: variables.
	^ g onState: aState
]

{ #category : #printing }
Fresh >> printOn: aStream [
	variables ifNotEmpty: [ 
		aStream nextPut: $!.
		variables allButLastDo: [ :each | 
			each printOn: aStream.
			aStream nextPut: Character space ].
		variables last printOn: aStream.
		aStream nextPutAll: '. ' ].
	(receiver valueWithArguments: variables)
		variables: innerVariables;
		printOn: aStream
]

{ #category : #accessing }
Fresh >> receiver [
	^ receiver
]

{ #category : #accessing }
Fresh >> receiver: aBlockClosure [
	receiver := aBlockClosure
]
