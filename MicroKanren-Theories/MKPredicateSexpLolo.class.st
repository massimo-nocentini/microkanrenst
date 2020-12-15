Class {
	#name : #MKPredicateSexpLolo,
	#superclass : #PredicateUnary,
	#category : #'MicroKanren-Theories-S-expressions'
}

{ #category : #running }
MKPredicateSexpLolo >> goal [

	^ Goal cond e
		  if: firstArgument nilo then: true asGoal;
		  otherwise: [ :a :d | 
			  (MKPredicateSexpConso value: a value: d value: firstArgument)
			  , ((MKPredicateSexpListo value: a) , (self class value: d)) ]
				  fresh
]

{ #category : #accessing }
MKPredicateSexpLolo >> name [

	^ 'lolº'
]
