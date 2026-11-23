"
I relate a mother and each of her descendants, according to `ChildTestPredicate`, for the tests.

```smalltalk
[ :x | DescendTestPredicate value: #martha value: x ]
	asGoal solutions readStream upToEnd.
""=> #(#charlotte #caroline #laura #rose)""
```
"
Class {
	#name : #DescendTestPredicate,
	#superclass : #PredicateBinary,
	#category : #'MicroKanren-Tests'
}

{ #category : #running }
DescendTestPredicate >> goal [
	^ (ChildTestPredicate value: firstArgument value: secondArgument)
		|
			[ :z | 
			(ChildTestPredicate value: firstArgument value: z)
				, (self class value: z value: secondArgument) ] asGoal
]
