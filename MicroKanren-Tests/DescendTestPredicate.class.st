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
