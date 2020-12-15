Class {
	#name : #MKPredicateSexpListo,
	#superclass : #PredicateUnary,
	#category : #'MicroKanren-Theories-S-expressions'
}

{ #category : #running }
MKPredicateSexpListo >> goal [

	^ Goal cond e
		  if: firstArgument nilo then: true asGoal;
		  otherwise: [ :d | 
			  (MKPredicateSexpCdro value: firstArgument value: d)
			  , (self class value: d) ] fresh
]

{ #category : #accessing }
MKPredicateSexpListo >> name [

	^ 'listº'
]
