as yet unclassified
adderº
	| genAdderº µ |
	µ := Theory sexp.
	genAdderº := [:b :n :m :r | [:a :c :d :e :x :y :z | (µ conso
				value: a
				value: x
				value: n)
				, (µ conso
						value: d
						value: y
						value: m)
				, (self positiveº value: y)
				, (µ conso
						value: c
						value: z
						value: r)
				, (self positiveº value: z)
				, (self bitFullAdderº valueWithArguments: {b. a. d. c. e}) , [self adderº valueWithArguments: {e. x. y. z}] eta] fresh].
	^ [:b :n :m :r | Goal cond e if: b =° 0
			, (self zeroº value: m) then: n =° r;
		 if: b =° 0
			, (self positiveº value: m)
			, (self zeroº value: n) then: m =° r;
		 if: b =° 1
			, (self zeroº value: m) then: [self adderº valueWithArguments: {0. n. 1 asConsedBinaryRepr. r}] eta;
		 if: b =° 1
			, (self positiveº value: m)
			, (self zeroº value: n) then: [self adderº valueWithArguments: {0. 1 asConsedBinaryRepr. m. r}] eta;
		 if: (self oneº value: n)
			, (self oneº value: m) then: [:a :c | {a. c} asCons =° r
			, (self bitFullAdderº valueWithArguments: {b. 1. 1. a. c})] fresh;
		 if: (self oneº value: n)
			, (self greaterThanOneº value: m) then: [genAdderº valueWithArguments: {b. n. m. r}] eta;
		 if: (self greaterThanOneº value: n)
			, (self oneº value: m) then: (self greaterThanOneº value: r)
			, [self adderº valueWithArguments: {b. 1 asConsedBinaryRepr. n. r}] eta;
		
		if: (self greaterThanOneº value: n)
				, (self greaterThanOneº value: m)
		then: ([genAdderº valueWithArguments: {b. n. m. r}]eta);
		 yourself]