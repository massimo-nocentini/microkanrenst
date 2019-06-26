Class {
	#name : #McCullochReverseRule,
	#superclass : #InductionRule,
	#category : #'MicroKanren-Theories'
}

{ #category : #computing }
McCullochReverseRule >> relateo [
	| µ |
	µ := Theory sexp.
	^ [:alpha :alpha_reversed | [:beta :gamma | (alpha
		unifyo value:  (4 cons: beta))
		, (µ reverseo value: gamma value: alpha_reversed)
		, (machine relateo value: beta value: gamma)] fresh]
]
