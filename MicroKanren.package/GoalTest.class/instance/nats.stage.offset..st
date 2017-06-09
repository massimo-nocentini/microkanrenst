as yet unclassified
nats: x stage: i offset: o
	^ (x unifyWith: i) | [ self nats: x stage: i + o ] eta