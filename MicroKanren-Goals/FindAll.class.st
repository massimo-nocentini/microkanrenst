Class {
	#name : #FindAll,
	#superclass : #BagOf,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
FindAll >> onState: aState [
	^ (super onState: aState)
		ifEmpty: [ (value unifyo value: nil) onState: aState ]
		ifNotEmpty: #yourself
]
