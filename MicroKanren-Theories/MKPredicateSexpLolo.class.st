"
I hold of a list of lists: nil, or a cons whose `car` is a proper list and whose `cdr` is a list of lists.

```smalltalk
([ :x | MKPredicateSexpLolo value: x ]
	asGoal solutions next: 3) readStream upToEnd.
""=> an Array(nil (nil) (nil nil))""
```
"
Class {
	#name : #MKPredicateSexpLolo,
	#superclass : #PredicateUnary,
	#category : #'MicroKanren-Theories-S-expressions'
}

{ #category : #running }
MKPredicateSexpLolo >> goal [

	^ Goal cond e
		  if: firstArgument nilo then: true asGoal;
		  otherwise: [ :a :d | 
			  (MKPredicateSexpConso value: a value: d value: firstArgument)
			  , ((MKPredicateSexpListo value: a) , (self class value: d)) ]
				  asGoal
]

{ #category : #accessing }
MKPredicateSexpLolo >> name [

	^ 'lolº'
]
