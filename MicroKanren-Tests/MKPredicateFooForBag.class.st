"
I am a predicate for the tests of `PredicateBagOfo` and `PredicateFindAllo`, which holds of five triples of symbols:

```smalltalk
[ :a :b :c | MKPredicateFooForBag value: a value: b value: c ]
	asGoal solutions readStream upToEnd.
""=> #(#(#a #b #c) #(#a #b #d) #(#b #c #e) #(#b #c #f) #(#c #c #g))""
```
"
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
