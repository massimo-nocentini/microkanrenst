Class {
	#name : #Reifier,
	#superclass : #Object,
	#instVars : [
		'state'
	],
	#category : #MicroKanren
}

{ #category : #dispatched }
Reifier >> _forCollection: aCollection [
	^ aCollection
		inject: state
		into: [ :s :c | 
			| r |
			r := self class new
				state: s;
				yourself.
			r value: c ]
]

{ #category : #dispatched }
Reifier >> forArray: aCollection [ 
	^ self _forCollection: aCollection
]

{ #category : #dispatched }
Reifier >> forCons: aCons [ 
	^ self _forCollection: aCons
]

{ #category : #dispatched }
Reifier >> forLinkedList: aCollection [ 
	^ self _forCollection: aCollection
]

{ #category : #dispatched }
Reifier >> forObject: anObj [ 
	^ state
]

{ #category : #dispatched }
Reifier >> forReifiedVar: aVar [
	^ state
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
	^ vars
		collect: [ :v | 
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
