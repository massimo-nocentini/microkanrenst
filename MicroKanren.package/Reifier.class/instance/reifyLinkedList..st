reification
reifyLinkedList: aCollection 
	^ aCollection
		inject: state
		into: [:s :c | (Reifier on: s) reify: c]