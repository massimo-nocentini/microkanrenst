"
I am the goal of a block with arguments: I introduce a new logic variable for each of them, with its name, evaluate the block with these variables and run the goal it answers. `BlockClosure>>asGoal` makes me.

```smalltalk
[ :x | [ :y | (x unifyo value: y) , (y unifyo value: 4) ] asGoal ]
	asGoal solutions readStream upToEnd.
""=> #(4)""
```

My `variables` are there once I have been run; the answers of `solutions` are about them. My receiver may be any object that understands `argumentNames` and `valueWithArguments:`, as `ACL` does.
"
Class {
	#name : #Fresh,
	#superclass : #Suspended,
	#instVars : [
		'variables'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Fresh >> onState: aState [

	^ aState collectVars: receiver argumentNames forFresh: self
]

{ #category : #dispatched }
Fresh >> onState: aState withVars: aCollection [

	variables := aCollection.
	nestedGoal := receiver valueWithArguments: self variables.
	^ super onState: aState
]

{ #category : #accessing }
Fresh >> variables [

	^ variables
]
