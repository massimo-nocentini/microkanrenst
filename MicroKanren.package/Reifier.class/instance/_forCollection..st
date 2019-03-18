dispatched
_forCollection: aCollection 
	^ aCollection
		inject: state
		into: [:s :c | s reifier value: c]