Class {
	#name : #McCullochAssociateRule,
	#superclass : #InductionRule,
	#category : 'MicroKanren-theories'
}

{ #category : #'as yet unclassified' }
McCullochAssociateRule >> associate: gamma is: associate machine: aMachine [
	^ aMachine sexpTheory let: associate be: gamma append: (2 cons: gamma)
]

{ #category : #computing }
McCullochAssociateRule >> consumes: three_alpha produces: alpha_two_alpha machine: aMachine [
	^ [ :beta :gamma | 
	(three_alpha unifyWith: (3 cons: beta))
		&
			((self associate: gamma is: alpha_two_alpha machine: aMachine)
				& (aMachine proves: beta relates: gamma)) ] fresh
]
