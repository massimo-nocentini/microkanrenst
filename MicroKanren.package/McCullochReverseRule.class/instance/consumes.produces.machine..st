computing
consumes: alpha produces: alpha_reversed machine: aMachine
	^ [ :beta :gamma | 
	(alpha unifyWith: (4 cons: beta))
		&
			((aMachine sexpTheory let: alpha_reversed reverse: gamma)
				& (aMachine proves: beta relates: gamma)) ] fresh