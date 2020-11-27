Class {
	#name : #MKPredicateSexpConso,
	#superclass : #PredicateTernary,
	#category : #'MicroKanren-Theories-S-expressions'
}

{ #category : #running }
MKPredicateSexpConso >> goal [

	^ (firstArgument cons: secondArgument) unifyo value: thirdArgument
]

{ #category : #accessing }
MKPredicateSexpConso >> name [

	^ 'consº'
]
