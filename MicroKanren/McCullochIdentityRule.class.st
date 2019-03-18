Class {
	#name : #McCullochIdentityRule,
	#superclass : #InductionRule,
	#category : 'MicroKanren-theories'
}

{ #category : #computing }
McCullochIdentityRule >> consumes: two_alpha produces: alpha machine: aMachine [
	^ two_alpha unifyWith: (2 cons: alpha)
]
