Class {
	#name : #MKPredicateSexpCdro,
	#superclass : #PredicateBinary,
	#category : #'MicroKanren-Theories-S-expressions'
}

{ #category : #running }
MKPredicateSexpCdro >> goal [

	^ [ :aCar | 
	  MKPredicateSexpConso
		  value: aCar
		  value: secondArgument
		  value: firstArgument ] asGoal
]

{ #category : #accessing }
MKPredicateSexpCdro >> name [

	^ 'cdrº'
]
