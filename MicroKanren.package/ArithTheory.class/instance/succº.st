as yet unclassified
succº
	^ [:n :nSucc | Goal cond e if: n zeroº then: nSucc oneº;
		 if: n positiveº then: nSucc greaterThanOneº , (self plusº §§ {1 asConsedBinaryRepr. n. nSucc});
		 yourself]