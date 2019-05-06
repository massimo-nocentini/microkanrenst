as yet unclassified
adderº
	^ [:b :n :m :r | Goal cond e if: b =° 0 , m zeroº then: n =° r;
		 if: b =° 0 , m positiveº , n zeroº then: m =° r;
		 if: b =° 1 , m zeroº then: [self adderº §§ {0. n. 1 asConsedBinaryRepr. r}] eta;
		 if: b =° 1 , m positiveº , n zeroº then: [self adderº §§ {0. 1 asConsedBinaryRepr. m. r}] eta;
		 if: n oneº , m oneº then: [:a :c | {a. c} asCons =° r , (self bitFullAdderº §§ {b. 1. 1. a. c})] fresh;
		 if: n oneº , m greaterThanOneº then: [self genAdderº §§ {b. n. m. r}] eta;
		 if: n greaterThanOneº , m oneº then: r greaterThanOneº , [self adderº §§ {b. 1 asConsedBinaryRepr. n. r}] eta;
		 if: n greaterThanOneº , m greaterThanOneº then: [self genAdderº §§ {b. n. m. r}] eta;
		 yourself]