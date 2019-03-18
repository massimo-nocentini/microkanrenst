"
Falsehood is a goal that admits no solutions at all.
"
Class {
	#name : #Fail,
	#superclass : #Goal,
	#category : 'MicroKanren-core'
}

{ #category : #running }
Fail >> onState: aState [
	^ Chain bottom
]
