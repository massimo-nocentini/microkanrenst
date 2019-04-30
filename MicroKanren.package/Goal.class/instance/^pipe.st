combining
| other 
	^ Disj new either: self;
		 or: other;
		 chainCombinationStrategy: Interleaved new;
		 yourself