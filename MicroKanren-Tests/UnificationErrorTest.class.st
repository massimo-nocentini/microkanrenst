"
An UnificationErrorTest is a test class for testing the behavior of UnificationError
"
Class {
	#name : #UnificationErrorTest,
	#superclass : #TestCase,
	#category : #'MicroKanren-Tests'
}

{ #category : #tests }
UnificationErrorTest >> testUnificationFailsOnArraysWithDifferentSizes [

	self
		should: [ SBRAL new asState unifier value: { 3 } value: { 4. 5 } ]
		raise: UnificationError
		whoseDescriptionIncludes:
		'#(4 5) cannot be unified with #(3) because they have different sizes'
		description: ''
]

{ #category : #tests }
UnificationErrorTest >> testUnificationFailsOnDifferentObjects [

	self
		should: [ SBRAL new asState unifier value: 3 value: 4 ]
		raise: UnificationError
		whoseDescriptionIncludes:
		'4 cannot be unified with 3 because they are different objects'
		description: ''
]
