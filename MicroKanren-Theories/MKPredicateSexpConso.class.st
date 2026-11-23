"
I relate an object, a second one and the cons of the two.

```smalltalk
[ :x :y |
	MKPredicateSexpConso value: x value: y value: #( 1 2 ) asCons ]
	asGoal solutions readStream upToEnd.
""=> an Array(an Array(1 (2)))""
```
"
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
