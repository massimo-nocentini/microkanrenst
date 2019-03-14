selecting
atMost: anInteger
|chain|
chain := (goal onState: self emptyState ).
	^ self reify: (chain next: anInteger) contents