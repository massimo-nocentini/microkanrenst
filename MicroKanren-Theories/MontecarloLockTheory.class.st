"
I am the theory of two machines, each an `InductiveRelation` made of McCulloch's rules:

- `mccullocho` has the rules `McCullochAssociateRule` and `McCullochIdentityRule`.
- `mclocko` has the rules `McCullochRepeatRule`, `McCullochReverseRule`, `McCullochRightHalfAssociateRule` and `McCullochShrinkRule`.

`Theory class>>montecarloLock` makes me.

```smalltalk
([ :x |
	Theory montecarloLock mccullocho value: #( 2 3 ) asCons value: x ]
	asGoal solutions next: 1) readStream upToEnd.
""=> an Array((3))""
```
"
Class {
	#name : #MontecarloLockTheory,
	#superclass : #Theory,
	#category : #'MicroKanren-Theories-theories'
}

{ #category : #'as yet unclassified' }
MontecarloLockTheory >> mccullocho [
	^ InductiveRelation new rules: {McCullochAssociateRule new. McCullochIdentityRule new};
		 relateo
]

{ #category : #'as yet unclassified' }
MontecarloLockTheory >> mclocko [
	^ InductiveRelation new rules: {McCullochRepeatRule new. McCullochReverseRule new. McCullochRightHalfAssociateRule new. McCullochShrinkRule new};
		 relateo
]
