"
I am the conjunction of two goals: I run the left one, then the right one on each of the states it answers, and join the resulting streams. The last goal on the path of such a state decides how to go on (`onState:forGoal:fromConj:`): a `Failed` one keeps the state as it is. `Goal>>,` makes me.

```smalltalk
[ :x :y | (x unifyo value: 1) , (y unifyo value: 2) ]
	asGoal solutions readStream upToEnd.
""=> #(#(1 2))""
```
"
Class {
	#name : #Conj,
	#superclass : #Binary,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Conj >> onState: aState afterPushingGoal: _ [

	^ (left onState: aState) appendMap: [ :refinedState | 
		  refinedState path value in: [ :aGoal | 
			  aGoal onState: refinedState forGoal: right fromConj: self ] ]
]
