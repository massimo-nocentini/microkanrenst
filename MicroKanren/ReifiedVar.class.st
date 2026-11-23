"
I stand for a variable without a value in the answers of a goal: a `Reifier` puts me, numbered from 0, in place of it. I print as `•` followed by my id as a subscript, and `Integer>>asReifiedVar` makes me.

```smalltalk
[ :x :y | x unifyo value: y ] asGoal solutions readStream upToEnd
	= { { 0 asReifiedVar. 0 asReifiedVar } }. ""=> true""
```
"
Class {
	#name : #ReifiedVar,
	#superclass : #Var,
	#category : #MicroKanren
}

{ #category : #converting }
ReifiedVar >> asRBNode [

	^ RBLogicVariableNode named: self symbol logicVar: self
]

{ #category : #'as yet unclassified' }
ReifiedVar >> reifyUsingReifier: aReifier [

	^ aReifier forReifiedVar: self
]

{ #category : #printing }
ReifiedVar >> symbol [
	^ '•'
]
