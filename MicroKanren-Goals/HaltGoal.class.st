Class {
	#name : #HaltGoal,
	#superclass : #Atomic,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
HaltGoal >> onState: aState [

	aState inspect.
	^ super onState: aState
]
