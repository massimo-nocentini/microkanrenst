as yet unclassified
nats: x stage: i
	^ (x unifyWith: i) | [ self nats: x stage: i + 1 ] eta