selecting
atMost: anInteger
	^ self reify: ((self emptyState into: goal) next: anInteger) contents