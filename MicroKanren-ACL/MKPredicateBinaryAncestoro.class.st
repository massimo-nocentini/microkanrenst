Class {
	#name : #MKPredicateBinaryAncestoro,
	#superclass : #PredicateBinary,
	#instVars : [
		'parentº',
		'unifyº'
	],
	#category : #'MicroKanren-ACL'
}

{ #category : #running }
MKPredicateBinaryAncestoro >> goal [

	^ [ :p | 
	  | pRB |
	  pRB := p asRBNode.
	  (parentº value: firstArgument value: pRB)
	  , ((unifyº value: pRB value: secondArgument) | (self copy
			    firstArgument: pRB;
			    secondArgument: secondArgument;
			    yourself)) ] asGoal
]

{ #category : #accessing }
MKPredicateBinaryAncestoro >> name [

	^ 'ancestorº'
]

{ #category : #accessing }
MKPredicateBinaryAncestoro >> parentº: anObject [

	parentº := anObject
]

{ #category : #accessing }
MKPredicateBinaryAncestoro >> unifyº: anObject [

	unifyº := anObject
]
