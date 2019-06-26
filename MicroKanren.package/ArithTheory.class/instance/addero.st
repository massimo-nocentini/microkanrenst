as yet unclassified
addero
	^ [:b :n :m :r | Goal cond e
		if: (b unifyo value: 0)
				, m zeroo
		then: (n unifyo value: r);
		
		if: (b unifyo value: 0)
				, m positiveo , n zeroo
		then: (m unifyo value: r);
		 if: (b unifyo value: 1)
			, m zeroo then: [self addero &&! {0. n. 1 asConsedBinaryRepr. r}] eta;
		 if: (b unifyo value: 1)
			, m positiveo , n zeroo then: [self addero &&! {0. 1 asConsedBinaryRepr. m. r}] eta;
		 if: n oneo , m oneo then: [:a :c | ({a. c} asCons unifyo value: r)
			, (self bitFullAddero &&! {b. 1. 1. a. c})] fresh;
		 if: n oneo then: [self genAddero &&! {b. n. m. r}] eta;
		 if: n greaterThanOneo , m oneo then: r greaterThanOneo , [self addero &&! {b. 1 asConsedBinaryRepr. n. r}] eta;
		 if: n greaterThanOneo then: [self genAddero &&! {b. n. m. r}] eta;
		 yourself]