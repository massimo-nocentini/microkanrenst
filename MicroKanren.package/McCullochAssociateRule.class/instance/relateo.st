computing
relateo
	| µ |
	µ := Theory sexp.
	^ [:three_beta :gamma_2_gamma | [:beta :gamma | three_beta
		=° (3 cons: beta)
		, (µ appendo
				value: gamma
				value: (2 cons: gamma)
				value: gamma_2_gamma)
		, (machine relateo value: beta value: gamma)] fresh]