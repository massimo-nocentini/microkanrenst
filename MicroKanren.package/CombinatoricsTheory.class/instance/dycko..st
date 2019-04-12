as yet unclassified
dycko: alpha 
|µ|
µ := Theory sexp.
	^ Goal cond e
		if: (µ nilo value: alpha)
		then: true asGoal;
		 else: [:beta :gamma | (µ appendo
			value: ($( cons: beta)
			value: ($) cons: gamma)
			value: alpha)
			& ([self dycko: beta] eta & [self dycko: gamma] eta)] fresh