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

{ #category : #'as yet unclassified' }
Walker >> walkDisuniteConstraints [

	^ state walkDisuniteConstraintsUsingWalker: self
]
