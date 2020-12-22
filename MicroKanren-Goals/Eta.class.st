Class {
	#name : #Eta,
	#superclass : #Suspended,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Eta >> onState: aState [

	^ [ 
	  nestedGoal := receiver value.
	  super onState: aState ] srfi41Stream
]
