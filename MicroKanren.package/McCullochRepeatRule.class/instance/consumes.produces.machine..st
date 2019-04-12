computing
consumes: alpha produces: gamma_gamma machine: aMachine
	^ [ :beta :gamma | 
	(alpha unifyWith: (5 cons: beta))
		&
			((aMachine sexpTheory appendo  value: gamma value: gamma value: gamma_gamma)
				& (aMachine proves: beta relates: gamma)) ] fresh