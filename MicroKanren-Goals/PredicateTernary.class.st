Class {
	#name : #PredicateTernary,
	#superclass : #PredicateBinary,
	#instVars : [
		'thirdArgument'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #evaluating }
PredicateTernary class >> value: fArg value: sArg value: tArg [

	^ (self value: fArg value: sArg)
		  thirdArgument: tArg;
		  yourself
]

{ #category : #printing }
PredicateTernary >> printOn: aStream renderer: aRenderer [

	aRenderer printOn: aStream aPredicateTernary: self
]

{ #category : #accessing }
PredicateTernary >> thirdArgument [

	^ thirdArgument
]

{ #category : #accessing }
PredicateTernary >> thirdArgument: anObject [

	thirdArgument := anObject
]
