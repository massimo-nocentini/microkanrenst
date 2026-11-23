"
I evaluate my block with the current state and succeed, in order to look at a computation from inside it. `BlockClosure>>inspectº` makes me.

```smalltalk
| seen |
seen := OrderedCollection new.
[ :x |
	(x unifyo value: 3)
	, [ :aState | seen add: (aState walk: x) ] inspectº ]
	asGoal solutions readStream upToEnd.
seen. ""=> an OrderedCollection(3)""
```
"
Class {
	#name : #MKGoalInspect,
	#superclass : #Atomic,
	#instVars : [
		'block'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
MKGoalInspect >> blockClosure: anObject [

	block := anObject
]

{ #category : #running }
MKGoalInspect >> onState: aState [

	block value: aState.

	^ super onState: aState
]
