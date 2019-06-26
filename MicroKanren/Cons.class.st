Class {
	#name : #Cons,
	#superclass : #Object,
	#instVars : [
		'car',
		'cdr'
	],
	#category : 'MicroKanren-datastructures'
}

{ #category : #creating }
Cons class >> car: anObj cdr: anotherObj [
	^ self new
		car: anObj;
		cdr: anotherObj;
		yourself
]

{ #category : #creating }
Cons class >> fromByteSymbol: aSymbol [
	^ aSymbol
]

{ #category : #creating }
Cons class >> fromObject: anObj [
	^ anObj
]

{ #category : #creating }
Cons class >> fromObject: anObj lastCdr: aCdr [
	^ self car: anObj cdr: aCdr
]

{ #category : #creating }
Cons class >> fromSequenceableCollection: aCollection [
	^ self fromSequenceableCollection: aCollection lastCdr: nil
]

{ #category : #creating }
Cons class >> fromSequenceableCollection: aCollection lastCdr: aCdr [ 
	^ aCollection
		foldr: [:each :acc | self car: each asCons cdr: acc asCons]
		init: aCdr
]

{ #category : #comparing }
Cons >> = anotherObject [
	^ self species == anotherObject species
		and: [ self car = anotherObject car and: [ self cdr = anotherObject cdr ] ]
]

{ #category : #converting }
Cons >> asLinkedList [
	^ (cdr ifNil: [ LinkedList new ] ifNotNil: [ cdr asLinkedList ])
		addFirst:
			(car class = self class
				ifTrue: [ car asLinkedList ]
				ifFalse: [ car ]);
		yourself
]

{ #category : #accessing }
Cons >> car [
	^ car
]

{ #category : #initializing }
Cons >> car: anObj [
	car := anObj
]

{ #category : #accessing }
Cons >> cdr [
	^ cdr
]

{ #category : #initializing }
Cons >> cdr: anObject [
	cdr := anObject
]

{ #category : #converting }
Cons >> collect: aBlock [ 
	| a d |
	a := car class = Cons
				ifTrue: [car collect: aBlock]
				ifFalse: [aBlock value: car].
	d := cdr class = Cons
				ifTrue: [cdr collect: aBlock]
				ifFalse: [cdr ifNotNil:[aBlock value: cdr]].
	^ a cons: d
]

{ #category : #comparing }
Cons >> hash [
	^  car hash bitXor:  cdr hash
]

{ #category : #'as yet unclassified' }
Cons >> inject: init into: aBlock [ 
	| accumulated |
	accumulated := aBlock value: init value: car.
	^ aBlock value: accumulated value: cdr
]

{ #category : #printing }
Cons >> printOn: aStream [ 
	| cell |
	aStream nextPut: $(.
	cell := self.
	[cell car printOn: aStream.
	cell cdr
		ifNotNil: [aStream nextPut: Character space].
	cell := cell cdr.
	cell class = Cons] whileTrue.
	cell
		ifNotNil: [aStream nextPut: $.;
				 nextPut: Character space.cell printOn: aStream.].
	
	aStream nextPut: $)
]

{ #category : #dispatching }
Cons >> reifyUsingReifier: aReifier [ 
	^ aReifier forCons: self 
]

{ #category : #dispatching }
Cons >> unifyWith: another usingUnifier: anUnifier [
	^ another unifyWithCons: self usingUnifier: anUnifier
]

{ #category : #dispatched }
Cons >> unifyWithCons: aCons usingUnifier: anUnifier [
	^ anUnifier forCons: self forCons: aCons
]

{ #category : #dispatched }
Cons >> unifyWithLinkedList: aCollection usingUnifier: anUnifier [ 
	^ self unifyWith: aCollection asCons usingUnifier: anUnifier
]

{ #category : #'as yet unclassified' }
Cons >> walkStarUsingWalker: aWalker [
	^ aWalker forCons: self 
]
