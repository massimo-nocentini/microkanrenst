"
I relate the list `2 β 2` to `β`, whatever the list `β` is. I do not need my machine.

```smalltalk
([ :x |
	McCullochShrinkRule new relateo
		value: #( 2 3 2 ) asCons
		value: x ]
	asGoal solutions next: 1) readStream upToEnd.
""=> an Array((3))""
```
"
Class {
	#name : #McCullochShrinkRule,
	#superclass : #InductionRule,
	#category : #'MicroKanren-Theories-McCulloch machine\'s rules'
}

{ #category : #computing }
McCullochShrinkRule >> relateo [
	| µ |
	µ := Theory sexp.
	^ [:alpha :beta | µ appendo
		value: (2 cons: beta)
		value: (2 cons: nil)
		value: alpha]
]
