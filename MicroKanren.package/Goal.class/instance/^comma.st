combining
, other 
	^ Conj new both: self;
		 and: other;
		chainCombinationStrategy: Sequential new;
		 yourself