Class {
	#name : #PrunedError,
	#superclass : #Error,
	#instVars : [
		'pruningStrategy'
	],
	#category : #MicroKanren
}

{ #category : #accessing }
PrunedError >> description [

	^ pruningStrategy description
]

{ #category : #'as yet unclassified' }
PrunedError >> onState: aState afterPruning: aPruning [

	^ false asGoal onState: aState
]

{ #category : #accessing }
PrunedError >> pruningStrategy: anObject [

	pruningStrategy := anObject
]
