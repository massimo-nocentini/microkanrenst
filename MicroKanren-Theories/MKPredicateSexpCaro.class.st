Class {
	#name : #MKPredicateSexpCaro,
	#superclass : #PredicateBinary,
	#category : #'MicroKanren-Theories-S-expressions'
}

{ #category : #running }
MKPredicateSexpCaro >> goal [

	^ [ :aCdr | 
	  MKPredicateSexpConso
		  value: secondArgument
		  value: aCdr
		  value: firstArgument ] asGoal
]

{ #category : #accessing }
MKPredicateSexpCaro >> name [

	^ 'car°'
]
