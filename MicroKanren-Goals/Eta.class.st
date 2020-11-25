Class {
	#name : #Eta,
	#superclass : #Goal,
	#instVars : [
		'goal'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
Eta >> goal [
	^ goal
]

{ #category : #initializing }
Eta >> goal: aGoal [
	goal := aGoal
]

{ #category : #running }
Eta >> onState: aState [

	^ [ (super onState: aState) , (goal onState: aState) ] srfi41Stream
]
