Class {
	#name : #Succeed,
	#superclass : #Goal,
	#category : 'MicroKanren-core'
}

{ #category : #running }
Succeed >> onState: aState [
	^ Chain with: aState
]
