Class {
	#name : #PredicateUnary,
	#superclass : #Predicate,
	#instVars : [
		'firstArgument'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
PredicateUnary class >> value: arg [
	^ self new
		firstArgument: arg;
		yourself
]

{ #category : #accessing }
PredicateUnary >> firstArgument [
	^ firstArgument
]

{ #category : #accessing }
PredicateUnary >> firstArgument: anObject [
	firstArgument := anObject
]

{ #category : #printing }
PredicateUnary >> printOn: aStream renderer: aRenderer [

	aRenderer printOn: aStream aPredicateUnary: self
]
