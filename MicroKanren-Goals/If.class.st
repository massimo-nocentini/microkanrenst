Class {
	#name : #If,
	#superclass : #Goal,
	#instVars : [
		'chainCombinationStrategy',
		'question',
		'answer',
		'otherwise'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
If >> answer [
	^ answer
]

{ #category : #initializing }
If >> answer: anAnswerGoal [
	answer := anAnswerGoal.
]

{ #category : #'as yet unclassified' }
If >> chainCombinationStrategy: aStrategy [ 
	chainCombinationStrategy := aStrategy
]

{ #category : #accessing }
If >> otherwise [
	^ otherwise
]

{ #category : #initializing }
If >> otherwise: anOtherwiseGoal [ 
	otherwise := anOtherwiseGoal
]

{ #category : #accessing }
If >> question [
	^ question
]

{ #category : #initializing }
If >> question: aQuestionGoal [ 
	question := aQuestionGoal.
]
