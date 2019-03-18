printing
printOn: aStream 
	| cell |
	aStream nextPut: $(.
	cell := self.
	[cell car printOn: aStream.
	cell cdr
		ifNotNil: [aStream nextPut: Character space].
	cell := cell cdr.
	cell class = Cons] whileTrue.
	cell
		ifNotNil: [aStream nextPut: $.;
				 nextPut: Character space.cell printOn: aStream.].
	
	aStream nextPut: $)