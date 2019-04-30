tests
testTablingMutuallyRecursive
	| fº gº |
	gº := nil.
	fº := [:x | Goal cond e if: x =° 0 then: true asGoal;
				
				if: true asGoal then: (gº value: x);
				 yourself].
	gº := [:x | Goal cond e if: x =° 1 then: true asGoal;
				
				if: true asGoal then: (fº value: x);
				 yourself].
	"self
	assert: {0. 1}
	equals: ([:q | fº value: q] fresh solutions next: 2) contents."
	fº := [:x | Goal cond e if: x =° 0 then: true asGoal;
				
				if: true asGoal then: (gº value: x);
				 yourself] tabled.
	gº := [:x | Goal cond e if: x =° 1 then: true asGoal;
				
				if: true asGoal then: (fº value: x);
				 yourself].
	self assert: {0. 1} equals: [:q | fº value: q] fresh solutions contents.
	fº := [:x | Goal cond e
				if: (x =° 0)
				then: true asGoal;
				
				if: true asGoal then: (gº value: x);
				 yourself].
	gº := [:x | Goal cond e
				if: (x =° 1)
				then: true asGoal;
				
				if: true asGoal then: (fº value: x);
				 yourself] tabled.
	self assert: {0. 1. 0} equals: [:q | fº value: q] fresh solutions contents