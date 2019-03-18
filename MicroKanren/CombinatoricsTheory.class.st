Class {
	#name : #CombinatoricsTheory,
	#superclass : #Object,
	#instVars : [
		'sexpTheory'
	],
	#category : 'MicroKanren-theories'
}

{ #category : #'as yet unclassified' }
CombinatoricsTheory >> dycko: alpha [
	^ Goal cond e
		if: alpha nilo then: true asGoal;
		else:
			[ :beta :gamma | 
			(sexpTheory let: alpha be: ($( cons: beta) append: ($) cons: gamma))
				& ([ self dycko: beta ] eta & [ self dycko: gamma ] eta) ] fresh
]

{ #category : #initialization }
CombinatoricsTheory >> initialize [
	super initialize.
	sexpTheory := SexpTheory new
]
