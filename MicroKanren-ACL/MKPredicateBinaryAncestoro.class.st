Class {
	#name : 'MKPredicateBinaryAncestoro',
	#superclass : 'PredicateBinary',
	#category : 'MicroKanren-ACL',
	#package : 'MicroKanren-ACL'
}

{ #category : 'running' }
MKPredicateBinaryAncestoro >> goal [

	| g1 g2 |
	g1 := MKPredicateBinaryParento
		      value: firstArgument
		      value: secondArgument.
	g2 := [ :p | 
	      | pRB |
	      pRB := p asRBNode.
	      (MKPredicateBinaryParento value: pRB value: secondArgument)
	      , (self copy
			       firstArgument: firstArgument;
			       secondArgument: pRB;
			       yourself) ] asGoal.
	^ g1 | g2
]

{ #category : 'accessing' }
MKPredicateBinaryAncestoro >> name [

	^ 'ancestorº'
]
