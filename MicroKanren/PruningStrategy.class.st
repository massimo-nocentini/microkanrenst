Class {
	#name : #PruningStrategy,
	#superclass : #Object,
	#category : #MicroKanren
}

{ #category : #'as yet unclassified' }
PruningStrategy >> description [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
PruningStrategy >> onState: aState fromPruning: aGoal [

	self subclassResponsibility
]
