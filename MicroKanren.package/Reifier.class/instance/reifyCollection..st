reification
reifyCollection: aCollection 
	^ aCollection
		inject: state
		into: [:s :c | s reifier
				reify: c]