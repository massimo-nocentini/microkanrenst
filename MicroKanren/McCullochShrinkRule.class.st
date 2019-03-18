Class {
	#name : #McCullochShrinkRule,
	#superclass : #InductionRule,
	#category : 'MicroKanren-theories'
}

{ #category : #computing }
McCullochShrinkRule >> consumes: alpha produces: beta machine: aMachine [
	^ aMachine sexpTheory let: alpha be: (2 cons: beta) append: (2 cons: nil)
]
