Class {
	#name : #Cons,
	#superclass : #Object,
	#instVars : [
		'car',
		'cdr'
	],
	#category : 'MicroKanren-core'
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
	| cell |
	cell := aCdr asCons.
	aCollection reverseDo: [ :each | cell := self car: each asCons cdr: cell ].
	^ cell
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
	^ self car hash bitXor: self cdr hash
]

{ #category : #'as yet unclassified' }
Cons >> inject: init into: aBlock [ 
	| accumulated |
	accumulated := aBlock value: init value: car.
	^ aBlock value: accumulated value: cdr
]

{ #category : #printing }
Cons >> printOn: aStream [
	aStream nextPut: $(.
	car printOn: aStream.
	aStream nextPut: Character space.
	cdr isNil
		ifTrue: [ aStream nextPut: $) ]
		ifFalse: [ cdr class = self class
				ifFalse: [ aStream nextPutAll: '. ' ].
			cdr printOn: aStream ]
]

{ #category : #dispatching }
Cons >> reifyUsing: aReifier [ 
	^ aReifier reifyCons: self 
]

{ #category : #dispatching }
Cons >> unifyWith: another usingUnifier: anUnifier onState: aState [
	^ another unifyWithCons: self usingUnifier: anUnifier onState: aState
]

{ #category : #dispatched }
Cons >> unifyWithCons: aCons usingUnifier: anUnifier onState: aState [
	^ anUnifier unifyCons: self withCons: aCons onState: aState
]

{ #category : #dispatched }
Cons >> unifyWithLinkedList: aCollection usingUnifier: anUnifier onState: aState [
	^ self unifyWith: aCollection asCons usingUnifier: anUnifier onState: aState
]

{ #category : #'as yet unclassified' }
Cons >> walkStarUsingWalker: aWalker [
	^ aWalker walkStarCons: self 
]
