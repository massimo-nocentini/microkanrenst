Class {
	#name : #If,
	#superclass : #Goal,
	#instVars : [
		'question',
		'answer',
		'otherwise'
	],
	#category : 'MicroKanren-core'
}

{ #category : #initializing }
If >> question: aQuestionGoal answer: anAnswerGoal otherwise: anOtherwiseGoal [
	question := aQuestionGoal.
	answer := anAnswerGoal.
	otherwise := anOtherwiseGoal
]
