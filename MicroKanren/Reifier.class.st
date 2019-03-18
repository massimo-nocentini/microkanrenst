Class {
	#name : #Reifier,
	#superclass : #Object,
	#instVars : [
		'state'
	],
	#category : 'MicroKanren-core'
}

{ #category : #'instance creation' }
Reifier class >> on: aState [ 
 ^ self new 
	state: aState;
	yourself
]

{ #category : #reification }
Reifier >> reify: anObj [ 
	^ (state walk: anObj)
		reifyUsing: self
]

{ #category : #reification }
Reifier >> reifyArray: aCollection [ 
	^ self reifyCollection: aCollection
]

{ #category : #reification }
Reifier >> reifyCollection: aCollection [ 
	^ aCollection
		inject: state
		into: [:s :c | s reifier
				reify: c]
]

{ #category : #dispatched }
Reifier >> reifyCons: aCons [ 
	^self reifyCollection: aCons
]

{ #category : #reification }
Reifier >> reifyLinkedList: aCollection [ 
	^ self reifyCollection: aCollection
]

{ #category : #dispatched }
Reifier >> reifyObject: anObj [
	^ state
]

{ #category : #reification }
Reifier >> reifyReifiedVar: aVar [ 
	^ state
]

{ #category : #reification }
Reifier >> reifyVar: aVar [ 
	^ state reifyVar: aVar
]

{ #category : #reification }
Reifier >> reifyVars: vars [ 
	| walker reifier |
	walker := state walker.
	reifier := Dictionary new asState reifier.
	^ vars
		collect: [:v | 
			| w s |
			w := walker walkStar: v.
			s := reifier reify: w.
			s walker walkStar: w]
]

{ #category : #accessing }
Reifier >> state: aState [ 
	state := aState
]
