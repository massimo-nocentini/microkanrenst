"
I relate the list `2 α` to `α`, whatever `α` is. I do not need my machine.

```smalltalk
[ :x |
	McCullochIdentityRule new relateo
		value: #( 2 3 ) asCons
		value: x ]
	asGoal solutions readStream upToEnd.
""=> an Array((3))""
```
"
Class {
	#name : #McCullochIdentityRule,
	#superclass : #InductionRule,
	#category : #'MicroKanren-Theories-McCulloch machine\'s rules'
}

{ #category : #computing }
McCullochIdentityRule >> relateo [
	^ [:two_alpha :alpha | two_alpha
		unifyo value:  (2 cons: alpha)]
]
