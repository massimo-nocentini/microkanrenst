Class {
	#name : #CombinatoricsTheory,
	#superclass : #Theory,
	#category : #'MicroKanren-Theories-theories'
}

{ #category : #'as yet unclassified' }
CombinatoricsTheory >> dycko [
	| µ |
	µ := Theory sexp.
	^ [ :alpha | 
	Goal cond e
		if: alpha nilo then: true asGoal;
		otherwise:
			[ :beta :gamma | 
			(µ appendo value: ($( cons: beta) value: ($) cons: gamma) value: alpha)
				, ([ self dycko value: beta ] eta , [ self dycko value: gamma ] eta) ]
				fresh;
		yourself ]
]
