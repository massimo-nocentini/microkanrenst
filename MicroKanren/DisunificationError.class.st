Class {
	#name : #DisunificationError,
	#superclass : #UnificationError,
	#category : #MicroKanren
}

{ #category : #'as yet unclassified' }
DisunificationError >> beforeUnificationState: aState deltaBindings: bindings fromUnify: aGoal [

	self shouldNotImplement
]

{ #category : #accessing }
DisunificationError >> description [

	^ String streamContents: [ :aStream | 
		  left printOn: aStream.
		  aStream nextPutAll: ' cannot be disunited with '.
		  right printOn: aStream.
		  aStream
			  nextPutAll: ' because ';
			  nextPutAll:
				  (self messageText ifEmpty: [ 'they are equal objects' ]) ]
]
