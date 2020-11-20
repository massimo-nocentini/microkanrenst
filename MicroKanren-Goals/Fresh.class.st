Class {
	#name : #Fresh,
	#superclass : #Goal,
	#instVars : [
		'receiver',
		'vars'
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
	vars := aCollection.
	g := receiver valueWithArguments: vars.
	^ g onState: aState
]

{ #category : #printing }
Fresh >> printOn: aStream [
	| vs |
	vs := vars ifNil: [ self halt.
		      (1 to: receiver numArgs) collect: [ :each | each asVar ] ].
	vs ifNotEmpty: [ 
		aStream nextPut: $!.
		vs allButLastDo: [ :each | 
			each printOn: aStream.
			aStream nextPut: Character space ].
		vs last printOn: aStream.
		aStream nextPutAll: '. ' ].
	(receiver valueWithArguments: vs) printOn: aStream
]

{ #category : #accessing }
Fresh >> receiver: aBlockClosure [
	receiver := aBlockClosure
]

{ #category : #reification }
Fresh >> vars [
	^ vars copy
]
