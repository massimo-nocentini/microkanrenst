"
I check whether a variable (`var`) occurs in an object, with respect to the values in a `state`. `Unifier` asks me before it gives an object as value to a variable, and takes a positive answer as a failure.

```smalltalk
OccurChecker new
	state: Dictionary new asState;
	var: 1 asVar;
	value: { 3. { 1 asVar } }. ""=> true""
```
"
Class {
	#name : #OccurChecker,
	#superclass : #Object,
	#instVars : [
		'var',
		'state'
	],
	#category : #MicroKanren
}

{ #category : #dispatched }
OccurChecker >> forCons: aCons [

	^ (self value: aCons car) or: [ self value: aCons cdr ]
]

{ #category : #dispatched }
OccurChecker >> forObject: anObj [

	^ anObj = var
		  ifTrue: [ 
			  Error signal:
				  'Logical inconsistency, re-check the entire unification algorithm.' ]
		  ifFalse: [ false ]
]

{ #category : #'as yet unclassified' }
OccurChecker >> forRBNode: aNode [

	^ RBProgramNodeOccurCheckVisitor new
		  occurChecker: self;
		  visitNode: aNode
]

{ #category : #dispatched }
OccurChecker >> forSequenceableCollection: aCollection [

	^ aCollection
		  inject: false
		  into: [ :aBoolean :c | aBoolean or: [ self value: c ] ]
]

{ #category : #dispatched }
OccurChecker >> forVar: aVar [

	^ var = aVar
]

{ #category : #accessing }
OccurChecker >> state: anObject [

	state := anObject
]

{ #category : #accessing }
OccurChecker >> value: anObject [

	^ (state walk: anObject) acceptOccurChecker: self
]

{ #category : #accessing }
OccurChecker >> var: anObject [

	var := anObject
]
