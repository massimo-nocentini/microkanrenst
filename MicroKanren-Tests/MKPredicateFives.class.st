"
I hold of 5, endlessly: I am used in the tests of infinite streams.

```smalltalk
([ :x | MKPredicateFives value: x ]
	asGoal solutions next: 3) readStream upToEnd.
""=> #(5 5 5)""
```
"
Class {
	#name : #MKPredicateFives,
	#superclass : #PredicateUnary,
	#category : #'MicroKanren-Tests'
}

{ #category : #running }
MKPredicateFives >> goal [

	^ (5 unifyo value: firstArgument) | [ self ] asGoal
]

{ #category : #accessing }
MKPredicateFives >> name [

	^ 'fivesº'
]
