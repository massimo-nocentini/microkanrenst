Class {
	#name : #HaltGoal,
	#superclass : #Atomic,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
HaltGoal >> onState: aState [

	self halt.

	^ super onState: aState
]
