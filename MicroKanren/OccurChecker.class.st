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
