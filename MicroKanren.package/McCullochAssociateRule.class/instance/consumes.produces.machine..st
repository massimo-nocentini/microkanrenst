computing
consumes: three_alpha produces: alpha_two_alpha machine: aMachine
	^ [ :beta :gamma | 
	(three_alpha unifyWith: (3 cons: beta))
		&
			((self associate: gamma is: alpha_two_alpha machine: aMachine)
				& (aMachine proves: beta relates: gamma)) ] fresh