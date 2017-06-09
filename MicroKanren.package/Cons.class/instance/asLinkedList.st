converting
asLinkedList
	^ (cdr ifNil: [ LinkedList new ] ifNotNil: [ cdr asLinkedList ])
		addFirst:
			(car class = self class
				ifTrue: [ car asLinkedList ]
				ifFalse: [ car ]);
		yourself