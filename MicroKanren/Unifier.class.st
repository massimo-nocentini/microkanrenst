Class {
	#name : #Unifier,
	#superclass : #Object,
	#instVars : [
		'state',
		'continuation'
	],
	#category : #MicroKanren
}

{ #category : #accessing }
Unifier >> continuation: anObject [

	continuation := anObject
]

{ #category : #dispatched }
Unifier >> forCons: aCons forCons: anotherCons [

	| carState |
	carState := self value: aCons car value: anotherCons car.
	^ carState unifier
		  continuation: continuation;
		  value: aCons cdr value: anotherCons cdr
]

{ #category : #unification }
Unifier >> forObject: anObj forObject: anotherObj [

	^ anObj = anotherObj
		  ifTrue: [ state ]
		  ifFalse: [ 
			  | error |
			  error := UnificationError new
				           left: anObj;
				           right: anotherObj;
				           yourself.
			  continuation value: error ]
]

{ #category : #'as yet unclassified' }
Unifier >> forSequenceableCollection: aCollection forSequenceableCollection: anotherCollection [

	^ aCollection size = anotherCollection size
		  ifTrue: [ 
			  (aCollection zip: anotherCollection)
				  inject: state
				  into: [ :s :pair | 
					  s unifier
						  continuation: continuation;
						  value: pair key value: pair value ] ]
		  ifFalse: [ 
			  | error |
			  error := UnificationError new
				           left: aCollection;
				           right: anotherCollection;
				           messageText: 'they have different sizes';
				           yourself.
			  continuation value: error ]
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
	^ aWalkedObj unifyWith: anotherWalkedObj usingUnifier: self
]
