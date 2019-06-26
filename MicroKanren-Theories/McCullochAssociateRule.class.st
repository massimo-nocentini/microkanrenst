Class {
	#name : #McCullochAssociateRule,
	#superclass : #InductionRule,
	#category : #'MicroKanren-Theories'
}

{ #category : #computing }
McCullochAssociateRule >> relateo [
	| µ |
	µ := Theory sexp.
	^ [:three_beta :gamma_2_gamma | [:beta :gamma | (three_beta
		unifyo value: (3 cons: beta))
		, (µ appendo
				value: gamma
				value: (2 cons: gamma)
				value: gamma_2_gamma)
		, (machine relateo value: beta value: gamma)] fresh]
]
