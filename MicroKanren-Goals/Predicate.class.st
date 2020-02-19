Class {
	#name : #Predicate,
	#superclass : #Goal,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Predicate >> goal [
	self subclassResponsibility
]

{ #category : #running }
Predicate >> onState: aState [
	^ self goal onState: aState
]
