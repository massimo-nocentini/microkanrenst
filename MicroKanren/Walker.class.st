"
I answer an object with the variables replaced by their values in my `state`, at any depth: `value:` looks the object up in the state, then visits the result by double dispatch (`walkStarUsingWalker:`) and answers a copy of conses, collections and AST nodes. `State>>walker` makes me.

```smalltalk
(Walker on: (Dictionary new
	at: 1 asVar put: 2 asVar;
	at: 2 asVar put: 5;
	yourself) asState)
		value: { 1 asVar. 7 }. ""=> #(5 7)""
```
"
Class {
	#name : #Walker,
	#superclass : #Object,
	#instVars : [
		'state'
	],
	#category : #MicroKanren
}

{ #category : #'instance creation' }
Walker class >> on: aState [ 
	^ self new state: aState; yourself
]

{ #category : #dispatched }
Walker >> forCons: aCons [

	^ (self value: aCons car) cons: (self value: aCons cdr)
]

{ #category : #dispatched }
Walker >> forObject: anObj [

	^ state walk: anObj
]

{ #category : #'as yet unclassified' }
Walker >> forRBNode: aNode [

	^ aNode acceptVisitor: (RBProgramNodeWalkVisitor new
			   walker: self;
			   yourself)
]

{ #category : #dispatched }
Walker >> forSequenceableCollection: aCollection [

	^ aCollection collect: [ :each | self value: each ]
]

{ #category : #accessing }
Walker >> state: aState [ 
	state := aState
]

{ #category : #dispatching }
Walker >> value: aVar [ 
	^ (state walk: aVar)
		walkStarUsingWalker: self
]
