Class {
	#name : #Disj,
	#superclass : #Goal,
	#instVars : [
		'either',
		'or'
	],
	#category : #MicroKanren
}

{ #category : #accessing }
Disj >> either: e [ 
	either := e
]

{ #category : #running }
Disj >> onState: aState [
	^ (either onState: aState) + (or onState: aState)
]

{ #category : #accessing }
Disj >> or: o [ 
	or := o
]
