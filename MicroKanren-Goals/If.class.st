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

{ #category : #accessing }
If >> answer [
	^ answer
]

{ #category : #initializing }
If >> answer: anAnswerGoal [
	answer := anAnswerGoal.
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
