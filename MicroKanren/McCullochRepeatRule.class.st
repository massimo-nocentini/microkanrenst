Class {
	#name : #McCullochRepeatRule,
	#superclass : #InductionRule,
	#category : 'MicroKanren-theories'
}

{ #category : #computing }
McCullochRepeatRule >> consumes: alpha produces: gamma_gamma machine: aMachine [
	^ [ :beta :gamma | 
	(alpha unifyWith: (5 cons: beta))
		&
			((aMachine sexpTheory let: gamma_gamma be: gamma append: gamma)
				& (aMachine proves: beta relates: gamma)) ] fresh
]
