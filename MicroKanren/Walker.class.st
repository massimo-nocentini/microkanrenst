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

{ #category : #accessing }
Walker >> state: aState [ 
	state := aState
]

{ #category : #dispatching }
Walker >> walkStar: aVar [ 
	^ (state walk: aVar)
		walkStarUsingWalker: self
]

{ #category : #dispatched }
Walker >> walkStarArray: aCollection [ 
	^ self walkStarCollection: aCollection
]

{ #category : #dispatched }
Walker >> walkStarCollection: aCollection [ 
	^ aCollection
		collect: [:each | self walkStar: each]
]

{ #category : #dispatched }
Walker >> walkStarCons: aCons [ 
^ self walkStarCollection:aCons
]

{ #category : #dispatched }
Walker >> walkStarLinkedList: aCollection [ 
	^ self walkStarCollection: aCollection
]

{ #category : #dispatched }
Walker >> walkStarObject: anObj [
	^ state walk: anObj
]
