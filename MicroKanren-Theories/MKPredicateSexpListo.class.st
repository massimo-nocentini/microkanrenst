"
I hold of a proper list: nil, or a cons whose `cdr` is a proper list.

```smalltalk
([ :x | MKPredicateSexpListo value: x ]
	asGoal solutions next: 2) readStream upToEnd
	= { nil. 0 asReifiedVar cons: nil }. ""=> true""
```
"
Class {
	#name : #MKPredicateSexpListo,
	#superclass : #PredicateUnary,
	#category : #'MicroKanren-Theories-S-expressions'
}

{ #category : #running }
MKPredicateSexpListo >> goal [

	^ Goal cond e
		  if: firstArgument nilo then: true asGoal;
		  otherwise: [ :d | 
			  (MKPredicateSexpCdro value: firstArgument value: d)
			  , (self class value: d) ] asGoal
]

{ #category : #accessing }
MKPredicateSexpListo >> name [

	^ 'listº'
]
