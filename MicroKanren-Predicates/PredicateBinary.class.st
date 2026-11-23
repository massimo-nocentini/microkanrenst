"
I am a predicate with two arguments. `PredicateBinary class>>value:value:` makes me out of them.

```smalltalk
[ :x | MKPredicateSexpCaro value: #( 1 2 ) asCons value: x ]
	asGoal solutions readStream upToEnd.
""=> #(1)""
```
"
Class {
	#name : #PredicateBinary,
	#superclass : #PredicateUnary,
	#instVars : [
		'secondArgument'
	],
	#category : #'MicroKanren-Predicates'
}

{ #category : #evaluating }
PredicateBinary class >> value: fArg value: sArg [
	^ (self value: fArg)
		secondArgument: sArg;
		yourself
]

{ #category : #printing }
PredicateBinary >> printOn: aStream renderer: aRenderer [

	aRenderer printOn: aStream aPredicateBinary: self
]

{ #category : #accessing }
PredicateBinary >> secondArgument [
	^ secondArgument
]

{ #category : #accessing }
PredicateBinary >> secondArgument: anObject [
	secondArgument := anObject
]
