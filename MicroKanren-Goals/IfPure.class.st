Class {
	#name : #IfPure,
	#superclass : #If,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
IfPure >> onState: aState afterPushingGoal: _ [

	| disj |
	disj := chainCombinationStrategy value
		        left: question , answer;
		        right: otherwise;
		        yourself.

	^ disj onState: aState
]
