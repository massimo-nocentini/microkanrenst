"
I am a binary relation given by a collection of `rules`, each of them an `InductionRule`: `relateo` answers a block of two arguments that answers the goal that some rule relates them. `rules:` makes me the machine of each rule, so that a rule can refer to the whole relation.

```smalltalk
| relation |
relation := InductiveRelation new
	rules: { McCullochIdentityRule new };
	yourself.
[ :x | relation relateo value: #( 2 7 ) asCons value: x ]
	asGoal solutions readStream upToEnd.
""=> an Array((7))""
```
"
Class {
	#name : #InductiveRelation,
	#superclass : #Object,
	#instVars : [
		'rules'
	],
	#category : #'MicroKanren-Extensions'
}

{ #category : #computing }
InductiveRelation >> relateo [
	^ [:anObj :anotherObj | 
	| g |
	g := Goal cond i.
	rules
		do: [:r | g
				if: (r relateo value: anObj value: anotherObj)
				then: true asGoal].
	g]
]

{ #category : #initializing }
InductiveRelation >> rules: aCollection [ 
	rules := aCollection collect: [:each | each machine: self; yourself]
]
