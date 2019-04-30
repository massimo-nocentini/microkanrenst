computing
relateº
	| µ |
	µ := Theory sexp.
	^ [:alpha :alpha_reversed | [:beta :gamma | alpha
		=° (4 cons: beta) , (µ reverseo value: gamma value: alpha_reversed)
			,, (machine relateº value: beta value: gamma)] fresh]