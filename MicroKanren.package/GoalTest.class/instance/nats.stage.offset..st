as yet unclassified
nats: x stage: i offset: o 
	^ (x unifyo value: i)
		| [self nats: x stage: i + o] eta