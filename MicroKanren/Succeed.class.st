Class {
	#name : #Succeed,
	#superclass : #Goal,
	#category : #MicroKanren
}

{ #category : #running }
Succeed >> onState: aState [
	^ Chain with: aState
]
