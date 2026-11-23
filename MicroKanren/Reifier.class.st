"
I turn the values of variables into answers: the variables that have no value are replaced by a `ReifiedVar`, numbered from 0 in the order I meet them.

- `reifyVars:` takes a collection of objects and answers the collection of their reifications in my `state`; `State>>reifier` makes me, and `Run` sends me this message for the variables of its goal.
- `value:` visits one object by double dispatch (`reifyUsingReifier:`) and answers the state that maps its variables to the reified ones.

```smalltalk
(Dictionary new asState reifier
	reifyVars: { 7 asVar. 9 asVar. { 9 asVar } })
	= { 0 asReifiedVar. 1 asReifiedVar. { 1 asReifiedVar } }.
""=> true""
```
"
Class {
	#name : #Reifier,
	#superclass : #Object,
	#instVars : [
		'state'
	],
	#category : #MicroKanren
}

{ #category : #dispatched }
Reifier >> forCons: aCons [

	state := self value: aCons car.
	^ self value: aCons cdr
]

{ #category : #dispatched }
Reifier >> forObject: anObj [

	^ state
]

{ #category : #'as yet unclassified' }
Reifier >> forRBNode: aNode [

	^ RBProgramNodeReifyVisitor new
		  state: state;
		  visitNode: aNode;
		  state
]

{ #category : #dispatched }
Reifier >> forReifiedVar: aVar [

	^ state
]

{ #category : #dispatched }
Reifier >> forSequenceableCollection: aCollection [

	^ aCollection inject: state into: [ :s :c | 
		  | r |
		  r := self class new
			       state: s;
			       yourself.
		  r value: c ]
]

{ #category : #dispatched }
Reifier >> forVar: aVar [

	^ state reifyVar: aVar forReifier: self
]

{ #category : #reification }
Reifier >> reifyVars: vars [

	| walker reifier |
	walker := state walker.
	reifier := self class new
		           state: Dictionary new asState;
		           yourself.
	^ vars collect: [ :v | 
		  | w s |
		  w := walker value: v.
		  s := reifier value: w.
		  s walker value: w ]
]

{ #category : #accessing }
Reifier >> state: aState [ 
	state := aState
]

{ #category : #reification }
Reifier >> value: anObj [ 
	^ (state walk: anObj)
		reifyUsingReifier: self
]
