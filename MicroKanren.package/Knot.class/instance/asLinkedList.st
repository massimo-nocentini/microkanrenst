listing
asLinkedList
	^ self next asLinkedList
		addFirst: item;
		yourself