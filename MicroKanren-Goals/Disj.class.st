"
I am the disjunction of two goals: I run both on the given state and join their streams with `appendStream:`. A suspended stream, which is a block, lets the other one go first. `Goal>>|` makes me.

```smalltalk
[ :x | (x unifyo value: 1) | (x unifyo value: 2) ]
	asGoal solutions readStream upToEnd.
""=> #(1 2)""
```

I keep a `combineBlock`, which joins two streams with `,` for `Disj class>>appended` and with `+` for `Disj class>>interleaved`; I do not evaluate it when I run.
"
Class {
	#name : #Disj,
	#superclass : #Binary,
	#instVars : [
		'combineBlock'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #creating }
Disj class >> appended [

	^ self new combineBlock: [ :aStream :anotherStream | 
		  aStream , anotherStream ]
]

{ #category : #creating }
Disj class >> interleaved [

	^ self new combineBlock: [ :aStream :anotherStream | 
		  aStream + anotherStream ]
]

{ #category : #accessing }
Disj >> combineBlock: aBlock [

	combineBlock := aBlock
]

{ #category : #running }
Disj >> onState: aState afterPushingGoal: _ [

	| aStream anotherStream |
	aStream := left onState: aState.
	anotherStream := right onState: aState.
	^ aStream appendStream: anotherStream
]
