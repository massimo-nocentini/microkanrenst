dispatched
interleavedStrategy: anInterleaved
	^ left isBlock
		ifTrue: [ (left value mplus: right) interleavedStrategy: anInterleaved ]
		ifFalse: [ left
				ifEmpty: [ right ]
				ifNotEmpty: [ | rest |
					rest := (right mplus: left cdr) interleavedStrategy: anInterleaved.
					rest
						addFirst: left car;
						yourself ] ]