Class {
	#name : #Unifier,
	#superclass : #Object,
	#category : 'MicroKanren-core'
}

{ #category : #dispatching }
Unifier >> unify: anObj with: anotherObj onState: aState [
	| aWalkedObj anotherWalkedObj |
	aWalkedObj := aState walk: anObj.
	anotherWalkedObj := aState walk: anotherObj.
	^ aWalkedObj unifyWith: anotherWalkedObj usingUnifier: self onState: aState
]

{ #category : #dispatched }
Unifier >> unifyCons: aCons withCons: anotherCons onState: aState [
	| carState |
	carState := self unify: aCons car with: anotherCons car onState: aState.
	^ self unify: aCons cdr with: anotherCons cdr onState: carState
]

{ #category : #unification }
Unifier >> unifyLinkedList: aCollection withLinkedList: anotherCollection onState: aState [
	^ aCollection size = anotherCollection size
		ifTrue: [ (aCollection zip: anotherCollection)
				inject: aState
				into: [ :s :pair | self unify: pair key with: pair value onState: s ] ]
		ifFalse: [ UnificationError signal ]
]

{ #category : #unification }
Unifier >> unifyObject: anObj withObject: anotherObj onState: aState [
	^ anObj = anotherObj
		ifTrue: [ aState ]
		ifFalse: [ UnificationError signal ]
]

{ #category : #unification }
Unifier >> unifyObject: anObj withVar: aVar onState: aState [
	^ self unifyVar: aVar withObject: anObj onState: aState
]

{ #category : #unification }
Unifier >> unifyVar: aVar withObject: anObject onState: aState [
	^ aState at: aVar put: anObject
]

{ #category : #dispatched }
Unifier >> unifyVar: aVar withVar: anotherVar onState: aState [
	^ aVar = anotherVar
		ifTrue: [ aState ]
		ifFalse: [ self unifyVar: aVar withObject: anotherVar onState: aState ]
]
