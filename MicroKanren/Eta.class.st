Class {
	#name : #Eta,
	#superclass : #Goal,
	#instVars : [
		'goal'
	],
	#category : 'MicroKanren-core'
}

{ #category : #initializing }
Eta >> goal: aGoal [
	goal := aGoal
]

{ #category : #running }
Eta >> onState: aState [
	^ goal onState: aState
]
