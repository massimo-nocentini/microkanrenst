as yet unclassified
lengthº
	| µ |
	µ := Theory arith.
	^ [:lst :n | Goal cond e
		if: (self nilo value: lst)
		then: (µ zeroº value: n);
		 if: [:cdr :res | (self cdro value: lst value: cdr)
			, (µ succº value: res value: n) , [self lengthº value: cdr value: res] eta] fresh then: true asGoal;
		 yourself]