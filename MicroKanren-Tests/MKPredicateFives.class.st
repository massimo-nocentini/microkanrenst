Class {
	#name : #MKPredicateFives,
	#superclass : #PredicateUnary,
	#category : #'MicroKanren-Tests'
}

{ #category : #running }
MKPredicateFives >> fives: x [
	^ (5 unifyo value: x) | [ self fives: x ] eta
]

{ #category : #running }
MKPredicateFives >> goal [
	^ [ :x | self fives: x ] fresh
]
