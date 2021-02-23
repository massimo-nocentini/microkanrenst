Class {
	#name : #Failed,
	#superclass : #Atomic,
	#category : #'MicroKanren-Goals'
}

{ #category : #testing }
Failed >> isFailed [

	^ true
]

{ #category : #'as yet unclassified' }
Failed >> onState: refinedState forGoal: right fromConj: aConj [

	^ ValueLink value: refinedState
]
