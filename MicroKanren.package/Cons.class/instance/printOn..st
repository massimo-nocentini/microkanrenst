printing
printOn: aStream
	aStream nextPut: $(.
	car printOn: aStream.
	aStream nextPut: Character space.
	cdr isNil
		ifTrue: [ aStream nextPut: $) ]
		ifFalse: [ cdr class = self class
				ifFalse: [ aStream nextPutAll: '. ' ].
			cdr printOn: aStream ]