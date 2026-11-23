"
I am the goal that always fails; `false asGoal` makes me. My stream holds a state too, with me as the last goal of its path: it is not sound, hence `Run` discards it, and a conjunction keeps it without running its right part.

```smalltalk
false asGoal asStatesStream value isSound. ""=> false""
false asGoal solutions readStream upToEnd. ""=> #()""
```
"
Class {
	#name : #Failed,
	#superclass : #Atomic,
	#category : #'MicroKanren-Goals'
}

{ #category : #testing }
Failed >> isFailed [

	^ true
]

{ #category : #'as yet unclassified' }
Failed >> onState: refinedState forGoal: right fromConj: aConj [

	^ ValueLink value: refinedState
]
