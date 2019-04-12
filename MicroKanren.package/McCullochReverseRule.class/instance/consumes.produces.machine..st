computing
consumes: alpha produces: alpha_reversed machine: aMachine
	^ [ :beta :gamma | 
	(alpha unifyWith: (4 cons: beta))
		&
			((aMachine sexpTheory reverseo value: gamma value: alpha_reversed)
				& (aMachine proves: beta relates: gamma)) ] fresh