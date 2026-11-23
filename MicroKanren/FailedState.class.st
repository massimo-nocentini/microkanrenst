"
I am the state in which a unification has failed. My `counterexample` is the `UnificationError` that tells which objects could not be unified; `ifCounterexampleFound:otherwise:` gives it to its first block, where any other state evaluates the second one.

```smalltalk
(3 unifyo value: 4) asStatesStream value
	ifCounterexampleFound: [ :error | error left -> error right ]
	otherwise: [ :aState | aState ]. ""=> 4->3""
```
"
Class {
	#name : #FailedState,
	#superclass : #State,
	#instVars : [
		'counterexample'
	],
	#category : #MicroKanren
}

{ #category : #accessing }
FailedState >> counterexample [

	^ counterexample
]

{ #category : #accessing }
FailedState >> counterexample: anObject [

	counterexample := anObject
]

{ #category : #'as yet unclassified' }
FailedState >> ifCounterexampleFound: ceBlock otherwise: oBlock [

	^ ceBlock cull: counterexample
]
