Class {
	#name : #TablingCall,
	#superclass : #Goal,
	#instVars : [
		'args',
		'cache'
	],
	#category : 'MicroKanren-core'
}

{ #category : #accessing }
TablingCall >> args: anArray [ 
	args := anArray
]

{ #category : #accessing }
TablingCall >> cache: aCollection [ 
	cache := aCollection
]

{ #category : #accessing }
TablingCall >> onState: aState [
	self subclassResponsibility
]
