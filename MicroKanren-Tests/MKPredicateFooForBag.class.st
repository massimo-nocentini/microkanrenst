Class {
	#name : #MKPredicateFooForBag,
	#superclass : #PredicateTernary,
	#category : #'MicroKanren-Tests'
}

{ #category : #running }
MKPredicateFooForBag >> goal [

	^ (firstArgument unifyo value: #a)
	  , (secondArgument unifyo value: #b)
	  , (thirdArgument unifyo value: #c)
	  |
		  ((firstArgument unifyo value: #a)
		   , (secondArgument unifyo value: #b)
		   , (thirdArgument unifyo value: #d))
	  |
		  ((firstArgument unifyo value: #b)
		   , (secondArgument unifyo value: #c)
		   , (thirdArgument unifyo value: #e))
	  |
		  ((firstArgument unifyo value: #b)
		   , (secondArgument unifyo value: #c)
		   , (thirdArgument unifyo value: #f))
	  |
		  ((firstArgument unifyo value: #c)
		   , (secondArgument unifyo value: #c)
		   , (thirdArgument unifyo value: #g))
]

{ #category : #accessing }
MKPredicateFooForBag >> name [

	^ 'fooº'
]
