Class {
	#name : #InductionRule,
	#superclass : #InductiveRelation,
	#instVars : [
		'machine'
	],
	#category : 'MicroKanren-ext'
}

{ #category : #computing }
InductionRule >> machine: anInductiveRelation [
	machine:= anInductiveRelation
]

{ #category : #computing }
InductionRule >> relateo [
	self subclassResponsibility
]
