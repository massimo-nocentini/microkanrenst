Class {
	#name : #Unifier,
	#superclass : #Object,
	#instVars : [
		'state'
	],
	#category : 'MicroKanren-core'
}

{ #category : #dispatched }
Unifier >> forArray: anArray forArray: anotherArray [
	^ self forCons: anArray asCons forCons: anotherArray asCons
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
		ifTrue: [(aCollection zip: anotherCollection)
				inject: state
				into: [:s :pair | s unifier value: pair key value: pair value]]
		ifFalse: [UnificationError signal]
]

{ #category : #unification }
Unifier >> forObject: anObj forObject: anotherObj [ 
	^ anObj = anotherObj
		ifTrue: [state]
		ifFalse: [UnificationError signal]
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
		ifTrue: [state]
		ifFalse: [self
				forVar: aVar
				forObject: anotherVar]
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
