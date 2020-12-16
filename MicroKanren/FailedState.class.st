Class {
	#name : #FailedState,
	#superclass : #State,
	#instVars : [
		'counterexample'
	],
	#category : #MicroKanren
}

{ #category : #accessing }
FailedState >> counterexample [

	^ counterexample
]

{ #category : #accessing }
FailedState >> counterexample: anObject [

	counterexample := anObject
]

{ #category : #'as yet unclassified' }
FailedState >> ifCounterexampleFound: ceBlock otherwise: oBlock [

	^ ceBlock cull: counterexample
]
