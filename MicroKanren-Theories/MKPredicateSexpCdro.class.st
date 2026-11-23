"
I relate a cons and its `cdr`.

```smalltalk
[ :x | MKPredicateSexpCdro value: #( 1 2 ) asCons value: x ]
	asGoal solutions readStream upToEnd.
""=> an Array((2))""
```
"
Class {
	#name : #MKPredicateSexpCdro,
	#superclass : #PredicateBinary,
	#category : #'MicroKanren-Theories-S-expressions'
}

{ #category : #running }
MKPredicateSexpCdro >> goal [

	^ [ :aCar | 
	  MKPredicateSexpConso
		  value: aCar
		  value: secondArgument
		  value: firstArgument ] asGoal
]

{ #category : #accessing }
MKPredicateSexpCdro >> name [

	^ 'cdrº'
]
