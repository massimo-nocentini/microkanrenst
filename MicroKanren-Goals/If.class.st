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

{ #category : #printing }
If >> printOn: aStream [

	aStream nextPutAll: 'if '.
	question printOn: aStream.
	aStream nextPutAll: ' then '.
	answer printOn: aStream.
	aStream nextPutAll: ' else '.
	otherwise printOn: aStream
]

{ #category : #initializing }
If >> question: aQuestionGoal [ 
	question := aQuestionGoal.
]
