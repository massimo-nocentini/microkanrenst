Class {
	#name : #MKPredicateSexpDycko,
	#superclass : #PredicateUnary,
	#category : #'MicroKanren-Theories-S-expressions'
}

{ #category : #running }
MKPredicateSexpDycko >> goal [

	^ Goal cond e
		  if: firstArgument nilo then: true asGoal;
		  otherwise: [ :beta :gamma | 
			  (MKPredicateSexpAppendo
				   value: ($( cons: beta)
				   value: ($) cons: gamma)
				   value: firstArgument)
			  , ((self class value: beta) , (self class value: gamma)) ] fresh;
		  yourself
]

{ #category : #accessing }
MKPredicateSexpDycko >> name [

	^ 'dyckº'
]
