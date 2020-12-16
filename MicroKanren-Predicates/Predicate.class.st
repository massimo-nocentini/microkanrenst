Class {
	#name : #Predicate,
	#superclass : #Goal,
	#category : #'MicroKanren-Predicates'
}

{ #category : #running }
Predicate >> goal [
	self subclassResponsibility
]

{ #category : #accessing }
Predicate >> name [

	self subclassResponsibility
]

{ #category : #running }
Predicate >> onState: aState [
	^ self goal onState: aState
]
