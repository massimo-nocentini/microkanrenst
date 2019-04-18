tests
testTablingMutuallyRecursive
	| fº gº |
	gº := nil.
	fº := [:x | Goal cond e
				if: (x unifyWith: 0)
				then: true asGoal;
				
				else: (gº value: x);
				 yourself].
	gº := [:x | Goal cond e
				if: (x unifyWith: 1)
				then: true asGoal;
				
				else: (fº value: x);
				 yourself].
	"self
		assert: {0. 1}
		equals: ([:q | fº value: q] fresh solutions atMost: 2)."
	fº := [:x | Goal cond e
				if: (x unifyWith: 0)
				then: true asGoal;
				
				else: (gº value: x);
				 yourself] tabled.
	gº := [:x | Goal cond e
				if: (x unifyWith: 1)
				then: true asGoal;
				
				else: (fº value: x);
				 yourself].
	self assert: {0. 1} equals: [:q | fº value: q] fresh solutions all.
	fº := [:x | Goal cond e
				if: (x unifyWith: 0)
				then: true asGoal;
				
				else: (gº value: x);
				 yourself].
	gº := [:x | Goal cond e
				if: (x unifyWith: 1)
				then: true asGoal;
				
				else: (fº value: x);
				 yourself] tabled.
	self assert: {0. 1. 0} equals: [:q | fº value: q] fresh solutions all