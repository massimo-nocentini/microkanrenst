Class {
	#name : #InductionRule,
	#superclass : #InductiveRelation,
	#instVars : [
		'machine'
	],
	#category : #'MicroKanren-Extensions'
}

{ #category : #computing }
InductionRule >> machine: anInductiveRelation [
	machine:= anInductiveRelation
]

{ #category : #computing }
InductionRule >> relateo [
	self subclassResponsibility
]
