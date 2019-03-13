about linked lists
testAppend
	| l1 l2 |
	l1 := LinkedList with: 1 with: 2 with: 3.
	l2 := LinkedList with: 4 with: 5 with: 6.
	self
		assert: l1 , l2
		equals:
			(LinkedList new
				add: 1;
				add: 2;
				add: 3;
				add: 4;
				add: 5;
				add: 6;
				yourself)