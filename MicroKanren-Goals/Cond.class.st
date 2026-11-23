"
I am a conditional goal, a list of `clauses`: each is a question and an answer, two goals, and I build a chain of `IfPure` goals out of them that ends with a `Failed` one. `Goal class>>cond` makes me; send me `e` or `i`, which choose the disjunction that combines the clauses (`Disj appended` or `Disj interleaved`), before you run me.

- `if:then:` adds a clause.
- `otherwise:` adds a clause whose question always succeeds.

```smalltalk
[ :x |
	Goal cond e
		if: (x unifyo value: #tea) then: true asGoal;
		if: (x unifyo value: #milk) then: false asGoal;
		otherwise: (x unifyo value: #cup);
		yourself ] asGoal solutions readStream upToEnd.
""=> #(#tea #cup)""
```
"
Class {
	#name : #Cond,
	#superclass : #Goal,
	#instVars : [
		'clauses',
		'if'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
Cond >> clauses [
	^ clauses
]

{ #category : #initializing }
Cond >> e [

	self ifPure: [ Disj appended ]
]

{ #category : #'as yet unclassified' }
Cond >> i [

	self ifPure: [ Disj interleaved ]
]

{ #category : #initializing }
Cond >> if: ifGoal then: thenGoal [
	clauses add: ifGoal -> thenGoal
]

{ #category : #'as yet unclassified' }
Cond >> ifPure: aStrategy [
	if := [ :clause :otherwise | 
	IfPure new
		question: clause key;
		answer: clause value;
		otherwise: otherwise;
		chainCombinationStrategy: aStrategy;
		yourself ]
]

{ #category : #initializing }
Cond >> initialize [
	super initialize.
	clauses := OrderedCollection new
]

{ #category : #running }
Cond >> onState: aState afterPushingGoal: _ [

	^ [ 
	  | g |
	  g := clauses foldr: if init: false asGoal.
	  g onState: aState ]
]

{ #category : #initializing }
Cond >> otherwise: aGoal [
	self if: true asGoal then: aGoal
]
