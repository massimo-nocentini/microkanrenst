combining
,, other 
	^ Conj new both: self;
		 and: other;
		 chainCombinationStrategy: Interleaved new;
		 yourself