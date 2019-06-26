Class {
	#name : #Walker,
	#superclass : #Object,
	#instVars : [
		'state'
	],
	#category : 'MicroKanren-core'
}

{ #category : #'instance creation' }
Walker class >> on: aState [ 
	^ self new state: aState; yourself
]

{ #category : #dispatched }
Walker >> _forCollection: aCollection [ 
	^ aCollection
		collect: [:each | self value: each]
]

{ #category : #dispatched }
Walker >> forArray: aCollection [ 
	^ self _forCollection: aCollection
]

{ #category : #dispatched }
Walker >> forCons: aCons [ 
	^ self _forCollection: aCons
]

{ #category : #dispatched }
Walker >> forLinkedList: aCollection [ 
	^ self _forCollection: aCollection
]

{ #category : #dispatched }
Walker >> forObject: anObj [ 
	^ state walk: anObj
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
