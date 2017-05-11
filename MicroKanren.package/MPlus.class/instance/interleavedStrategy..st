dispatched
interleavedStrategy: anInterleaved
	^ left
		ifEmpty: [ right ]
		ifNotEmpty: [ | rest |
			rest := (right mplus: left cdr) interleavedStrategy: anInterleaved.
			rest
				addFirst: left car;
				yourself ]