"
I relate two lists and the list made of the elements of the former followed by those of the latter; the second argument becomes the tail, whatever it is.

```smalltalk
[ :x |
	MKPredicateSexpAppendo
		value: #( 1 ) asCons
		value: x
		value: #( 1 2 3 ) asCons ]
	asGoal solutions readStream upToEnd.
""=> an Array((2 3))""
```
"
Class {
	#name : #MKPredicateSexpAppendo,
	#superclass : #PredicateTernary,
	#category : #'MicroKanren-Theories-S-expressions'
}

{ #category : #running }
MKPredicateSexpAppendo >> goal [

	^ Goal cond e
		  if: firstArgument nilo
		  then: (thirdArgument unifyo value: secondArgument);
		  otherwise: [ :a :d :rec | 
			  (MKPredicateSexpConso value: a value: d value: firstArgument)
			  , (MKPredicateSexpConso value: a value: rec value: thirdArgument)
			  , (self class value: d value: secondArgument value: rec) ] asGoal;
		  yourself
]

{ #category : #accessing }
MKPredicateSexpAppendo >> name [

	^ 'appendº'
]
