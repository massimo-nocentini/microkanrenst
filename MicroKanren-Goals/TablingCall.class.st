"
I am the superclass of the goals that work on the `cache` of the answers of a tabled goal, for the arguments `args` of a call. See `Tabled`, `Master` and `Reuse`.
"
Class {
	#name : #TablingCall,
	#superclass : #Goal,
	#instVars : [
		'args',
		'cache'
	],
	#category : #'MicroKanren-Goals'
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
