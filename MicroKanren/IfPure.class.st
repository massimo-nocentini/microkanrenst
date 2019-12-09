Class {
	#name : #IfPure,
	#superclass : #If,
	#category : #MicroKanren
}

{ #category : #running }
IfPure >> onState: aState [
	^ chainCombinationStrategy
		value: (question , answer onState: aState)
		value: (otherwise onState: aState)
]
