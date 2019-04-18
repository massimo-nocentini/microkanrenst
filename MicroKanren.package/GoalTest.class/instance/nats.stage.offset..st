as yet unclassified
nats: x stage: i offset: o 
	^ (x =° i)
		| [self nats: x stage: i + o] eta