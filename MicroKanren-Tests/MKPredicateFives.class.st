Class {
	#name : #MKPredicateFives,
	#superclass : #PredicateUnary,
	#category : #'MicroKanren-Tests'
}

{ #category : #running }
MKPredicateFives >> goal [

	^ (5 unifyo value: firstArgument) | [ self ] eta
]

{ #category : #accessing }
MKPredicateFives >> name [

	^ 'fivesº'
]
