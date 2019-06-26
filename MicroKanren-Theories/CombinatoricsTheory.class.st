Class {
	#name : #CombinatoricsTheory,
	#superclass : #Theory,
	#category : #'MicroKanren-Theories-theories'
}

{ #category : #'as yet unclassified' }
CombinatoricsTheory >> dycko [
	| µ |
	µ := Theory sexp.
	^ [:alpha | Goal cond e if: alpha nilo then: true asGoal;
		 if: true asGoal then: [:beta :gamma | µ appendo &&! {$( cons: beta. $) cons: gamma. alpha} , ([self dycko value: beta] eta , [self dycko value: gamma] eta)] fresh;
		 yourself]
]
