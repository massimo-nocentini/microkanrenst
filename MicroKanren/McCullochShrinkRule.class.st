Class {
	#name : #McCullochShrinkRule,
	#superclass : #InductionRule,
	#category : 'MicroKanren-theories'
}

{ #category : #computing }
McCullochShrinkRule >> relateo [
	| µ |
	µ := Theory sexp.
	^ [:alpha :beta | µ appendo
		value: (2 cons: beta)
		value: (2 cons: nil)
		value: alpha]
]
