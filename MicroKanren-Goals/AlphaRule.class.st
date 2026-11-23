"
I am the goal that two objects, `x` and `y`, are equal once reified in the given state, when I am run: I do not unify them. `Goal class>>alpha:rule:` and `SexpTheory>>alphaRuleo` make me.

```smalltalk
[ :x | (x unifyo value: 3) , (Goal alpha: x rule: 3) ]
	asGoal solutions readStream upToEnd.
""=> #(3)""
[ :x | (Goal alpha: x rule: 3) , (x unifyo value: 3) ]
	asGoal solutions readStream upToEnd.
""=> #()""
```
"
Class {
	#name : #AlphaRule,
	#superclass : #Goal,
	#instVars : [
		'x',
		'y'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
AlphaRule >> onState: aState [

	^ [ 
	  (x isAlphaEquivalentTo: y inState: aState) asGoal onState: aState ]
]

{ #category : #accessing }
AlphaRule >> x: anObj [
	x := anObj
]

{ #category : #accessing }
AlphaRule >> y: anObj [
	y := anObj
]
