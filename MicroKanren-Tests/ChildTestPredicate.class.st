Class {
	#name : #ChildTestPredicate,
	#superclass : #PredicateBinary,
	#category : #'MicroKanren-Tests'
}

{ #category : #running }
ChildTestPredicate >> goal [
	^ ((firstArgument unifyo value: #martha)
		, (secondArgument unifyo value: #charlotte))
		|
			((firstArgument unifyo value: #charlotte)
				, (secondArgument unifyo value: #caroline))
		|
			((firstArgument unifyo value: #caroline)
				, (secondArgument unifyo value: #laura))
		|
			((firstArgument unifyo value: #laura)
				, (secondArgument unifyo value: #rose))
]
