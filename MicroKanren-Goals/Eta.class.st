"
I am the goal of a block without arguments, which answers a goal. I evaluate the block only when my stream is asked for, hence a definition can refer to itself inside of me. `BlockClosure>>asGoal` makes me.

```smalltalk
| fives |
fives := nil.
fives := [ :x | (x unifyo value: 5) | [ fives value: x ] asGoal ].
([ :x | fives value: x ]
	asGoal solutions next: 3) readStream upToEnd.
""=> #(5 5 5)""
```
"
Class {
	#name : #Eta,
	#superclass : #Suspended,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Eta >> onState: aState [

	^ [ 
	  nestedGoal := receiver value.
	  super onState: aState ]
]
