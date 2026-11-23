"
I relate a cons and its `car`.

```smalltalk
[ :x | MKPredicateSexpCaro value: #( 1 2 ) asCons value: x ]
	asGoal solutions readStream upToEnd.
""=> #(1)""
```
"
Class {
	#name : #MKPredicateSexpCaro,
	#superclass : #PredicateBinary,
	#category : #'MicroKanren-Theories-S-expressions'
}

{ #category : #running }
MKPredicateSexpCaro >> goal [

	^ [ :aCdr | 
	  MKPredicateSexpConso
		  value: secondArgument
		  value: aCdr
		  value: firstArgument ] asGoal
]

{ #category : #accessing }
MKPredicateSexpCaro >> name [

	^ 'car°'
]
