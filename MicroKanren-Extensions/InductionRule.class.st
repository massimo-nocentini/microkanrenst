"
I am a rule of an `InductiveRelation`, my `machine`: subclasses implement `relateo`, which answers a block of two arguments that answers a goal about them, possibly by means of the relation of the machine itself.
"
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
