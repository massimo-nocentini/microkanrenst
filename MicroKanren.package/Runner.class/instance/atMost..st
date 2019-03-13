selecting
atMost: anInteger
	^ self reify: ((self emptyState into: goal) atMost: anInteger) mature