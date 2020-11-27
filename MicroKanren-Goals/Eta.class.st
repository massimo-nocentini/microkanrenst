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

	^ [ 
	  | g |
	  g := goal value.
	  (super onState: aState) , (g onState: aState) ] srfi41Stream
]
