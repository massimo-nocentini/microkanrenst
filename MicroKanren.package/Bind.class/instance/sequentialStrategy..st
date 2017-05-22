dispatched
sequentialStrategy: aSequential
	^ stream isBlock
		ifTrue: [ [ (stream value bind: combiner) sequentialStrategy: aSequential ] ]
		ifFalse: [ stream
				ifEmpty: [ LinkedList new ]
				ifNotEmpty: [ | alpha beta |
					beta := (stream cdr bind: combiner) sequentialStrategy: aSequential.
					alpha := stream car into: combiner.
					(alpha mplus: beta) sequentialStrategy: aSequential ] ]