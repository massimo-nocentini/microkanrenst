Class {
	#name : #If,
	#superclass : #GoalWithChainCombinationStrategy,
	#instVars : [
		'question',
		'answer',
		'otherwise'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #initializing }
If >> answer: anAnswerGoal [
	answer := anAnswerGoal.
]

{ #category : #initializing }
If >> otherwise: anOtherwiseGoal [ 
	otherwise := anOtherwiseGoal
]

{ #category : #initializing }
If >> question: aQuestionGoal [ 
	question := aQuestionGoal.
]
