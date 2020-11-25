Class {
	#name : #Eta,
	#superclass : #Goal,
	#instVars : [
		'goal'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #initializing }
Eta >> goal: aGoal [
	goal := aGoal
]

{ #category : #running }
Eta >> onState: aState [

	^ [ (super onState: aState) , (goal onState: aState) ] srfi41Stream
]

{ #category : #printing }
Eta >> printOn: aStream [

	goal receiver printOn: aStream.
	aStream nextPut: $°
]
