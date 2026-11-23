"
I am a predicate with three arguments. `PredicateTernary class>>value:value:value:` makes me out of them.

```smalltalk
[ :x |
	MKPredicateSexpAppendo
		value: #( 1 ) asCons
		value: #( 2 ) asCons
		value: x ]
	asGoal solutions readStream upToEnd.
""=> an Array((1 2))""
```
"
Class {
	#name : #PredicateTernary,
	#superclass : #PredicateBinary,
	#instVars : [
		'thirdArgument'
	],
	#category : #'MicroKanren-Predicates'
}

{ #category : #evaluating }
PredicateTernary class >> value: fArg value: sArg value: tArg [

	^ (self value: fArg value: sArg)
		  thirdArgument: tArg;
		  yourself
]

{ #category : #printing }
PredicateTernary >> printOn: aStream renderer: aRenderer [

	aRenderer printOn: aStream aPredicateTernary: self
]

{ #category : #accessing }
PredicateTernary >> thirdArgument [

	^ thirdArgument
]

{ #category : #accessing }
PredicateTernary >> thirdArgument: anObject [

	thirdArgument := anObject
]
