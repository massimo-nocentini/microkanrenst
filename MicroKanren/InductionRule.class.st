Class {
	#name : #InductionRule,
	#superclass : #Object,
	#category : 'MicroKanren-theories'
}

{ #category : #computing }
InductionRule >> consumes: anObj produces: anotherObj machine: anInductiveRelationsTheory [
	self subclassResponsibility
]
