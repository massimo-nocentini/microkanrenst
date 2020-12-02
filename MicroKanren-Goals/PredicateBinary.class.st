Class {
	#name : #PredicateBinary,
	#superclass : #PredicateUnary,
	#instVars : [
		'secondArgument'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #evaluating }
PredicateBinary class >> value: fArg value: sArg [
	^ (self value: fArg)
		secondArgument: sArg;
		yourself
]

{ #category : #printing }
PredicateBinary >> printOn: aStream renderer: aRenderer [

	aRenderer printOn: aStream aPredicateBinary: self
]

{ #category : #accessing }
PredicateBinary >> secondArgument [
	^ secondArgument
]

{ #category : #accessing }
PredicateBinary >> secondArgument: anObject [
	secondArgument := anObject
]
