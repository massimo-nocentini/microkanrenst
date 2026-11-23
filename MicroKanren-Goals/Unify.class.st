"
I am the goal that unifies `left` and `right`, with the `Unifier` of the given state. I go on with a `Succeed` goal on the extended state, or with a `Failed` goal on a `FailedState`. `Object>>unifyo` and `Object>>unifyWith:` make me.

```smalltalk
[ :x | { 1. x } unifyo value: { 1. 2 } ]
	asGoal solutions readStream upToEnd.
""=> #(2)""
```
"
Class {
	#name : #Unify,
	#superclass : #Binary,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Unify >> onState: aState afterPushingGoal: aGoal [

	| aStateOrException |
	aStateOrException := [ :k | 
	                     aState unifier
		                     continuation: k;
		                     value: left value: right ] valueWithExitUnary.
	^ aStateOrException onState: aState afterUnificationByUnify: self
]
