tests
testTablingAnswersInsteadOfSubstitutions
	| fº gº |
	fº := [:z | z =° 6] tabled.
	gº := [:x :y | Goal cond e
				if: x =° 5
				then: (fº value: y);
				
			if: true asGoal	then: (fº value: y)] fresh.
	self assert: {{5. 6}. {0 asReifiedVar. 6}} equals: gº solutions contents