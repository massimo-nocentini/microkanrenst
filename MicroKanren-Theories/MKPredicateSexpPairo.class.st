Class {
	#name : #MKPredicateSexpPairo,
	#superclass : #PredicateUnary,
	#category : #'MicroKanren-Theories-S-expressions'
}

{ #category : #running }
MKPredicateSexpPairo >> goal [

	^ [ :a :d | 
	  MKPredicateSexpConso value: a value: d value: firstArgument ] asGoal
]

{ #category : #accessing }
MKPredicateSexpPairo >> name [

	^ 'pairº'
]
