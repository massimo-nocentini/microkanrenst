Class {
	#name : #Binary,
	#superclass : #Goal,
	#instVars : [
		'left',
		'right'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
Binary >> left [

	^ left
]

{ #category : #accessing }
Binary >> left: anObject [

	left := anObject
]

{ #category : #accessing }
Binary >> right [

	^ right
]

{ #category : #accessing }
Binary >> right: anObject [

	right := anObject
]
