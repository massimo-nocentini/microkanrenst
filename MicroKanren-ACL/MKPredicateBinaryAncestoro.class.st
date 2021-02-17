Class {
	#name : #MKPredicateBinaryAncestoro,
	#superclass : #PredicateBinary,
	#category : #'MicroKanren-ACL'
}

{ #category : #running }
MKPredicateBinaryAncestoro >> goal [

	^ [ :p | 
	  | pRB |
	  pRB := p asRBNode.
	  (MKPredicateBinaryParento value: firstArgument value: pRB)
	  , ((self unifyº value: pRB value: secondArgument) | (self copy
			    firstArgument: pRB;
			    secondArgument: secondArgument;
			    yourself)) ] asGoal
]

{ #category : #accessing }
MKPredicateBinaryAncestoro >> name [

	^ 'ancestorº'
]
