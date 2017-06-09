as yet unclassified
dycko: alpha
	^ Goal cond e
		if: alpha nilo then: true asGoal;
		else:
			[ :beta :gamma | 
			(sexpTheory let: alpha be: ($( cons: beta) append: ($) cons: gamma))
				& ([ self dycko: beta ] eta & [ self dycko: gamma ] eta) ] fresh