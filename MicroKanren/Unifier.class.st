Class {
	#name : #Unifier,
	#superclass : #Object,
	#instVars : [
		'state'
	],
	#category : #MicroKanren
}

{ #category : #dispatched }
Unifier >> forArray: anArray forArray: anotherArray [

	^ anArray size = anotherArray size
		  ifTrue: [ 
		  self forCons: anArray asCons forCons: anotherArray asCons ]
		  ifFalse: [ 
			  UnificationError new
				  left: anArray;
				  right: anotherArray;
				  signal: 'they have different sizes' ]
]

{ #category : #dispatched }
Unifier >> forCons: aCons forCons: anotherCons [ 
	| carState |
	carState := state unifier value: aCons car value: anotherCons car.
	^ carState unifier value: aCons cdr value: anotherCons cdr
]

{ #category : #unification }
Unifier >> forLinkedList: aCollection forLinkedList: anotherCollection [

	^ aCollection size = anotherCollection size
		  ifTrue: [ 
			  (aCollection zip: anotherCollection)
				  inject: state
				  into: [ :s :pair | s unifier value: pair key value: pair value ] ]
		  ifFalse: [ 
			  UnificationError new
				  left: aCollection;
				  right: anotherCollection;
				  signal: 'they have different sizes' ]
]

{ #category : #unification }
Unifier >> forObject: anObj forObject: anotherObj [

	^ anObj = anotherObj
		  ifTrue: [ state ]
		  ifFalse: [ 
			  UnificationError new
				  left: anObj;
				  right: anotherObj;
				  signal ]
]

{ #category : #unification }
Unifier >> forObject: anObj forVar: aVar [
	^ self
		forVar: aVar
		forObject: anObj
]

{ #category : #unification }
Unifier >> forVar: aVar forObject: anObject [
	^ state at: aVar put: anObject
]

{ #category : #dispatched }
Unifier >> forVar: aVar forVar: anotherVar [
	^ aVar = anotherVar
		ifTrue: [ state ]
		ifFalse: [ | v w |
			v := aVar.
			w := anotherVar.
			w id < v id
				ifTrue: [ w := aVar.
					v := anotherVar ].
			self forVar: w forObject: v ]
]

{ #category : #accessing }
Unifier >> state: aState [ 
	state := aState
]

{ #category : #dispatching }
Unifier >> value: anObj value: anotherObj [ 
	| aWalkedObj anotherWalkedObj |
	aWalkedObj := state walk: anObj.
	anotherWalkedObj := state walk: anotherObj.
	^ aWalkedObj
		unifyWith: anotherWalkedObj
		usingUnifier: self
]
