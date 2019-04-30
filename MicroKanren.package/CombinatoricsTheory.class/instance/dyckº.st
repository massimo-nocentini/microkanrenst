as yet unclassified
dyckº
	| µ |
	µ := Theory sexp.
	^ [:alpha | Goal cond e
		if: (µ nilo value: alpha)
		then: true asGoal;
		if: true asGoal then: [:beta :gamma | (µ appendo
			value: ($( cons: beta)
			value: ($) cons: gamma)
			value: alpha)
			,, ([self dyckº value: beta] eta ,, [self dyckº value: gamma] eta)] fresh;yourself]