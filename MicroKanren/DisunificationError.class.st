Class {
	#name : #DisunificationError,
	#superclass : #UnificationError,
	#category : #MicroKanren
}

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
