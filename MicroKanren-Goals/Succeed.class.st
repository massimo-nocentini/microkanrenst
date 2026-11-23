"
I am the goal that always succeeds; `true asGoal` makes me. When I am the last goal on the path, in the left part of a conjunction, I remove myself from it.

```smalltalk
true asGoal solutions readStream upToEnd. ""=> #(#tautology)""
```
"
Class {
	#name : #Succeed,
	#superclass : #Atomic,
	#category : #'MicroKanren-Goals'
}

{ #category : #'as yet unclassified' }
Succeed >> popGoalFromPathOfState: aState forConj: aGoal [

	aState path: aState path nextLink
]
