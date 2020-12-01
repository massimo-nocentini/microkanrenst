Class {
	#name : #MKPredicateSexpAppendo,
	#superclass : #PredicateTernary,
	#category : #'MicroKanren-Theories-S-expressions'
}

{ #category : #running }
MKPredicateSexpAppendo >> goal [

	^ Goal cond e
		  if: firstArgument nilo
		  then: (thirdArgument unifyo value: secondArgument);
		  otherwise: [ :a :d :rec | 
			  (MKPredicateSexpConso value: a value: d value: firstArgument)
			  , (MKPredicateSexpConso value: a value: rec value: thirdArgument)
			  , (self class value: d value: secondArgument value: rec) ] fresh;
		  yourself
]

{ #category : #accessing }
MKPredicateSexpAppendo >> name [

	^ 'appendº'
]
