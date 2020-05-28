Class {
	#name : #LittleProverTest,
	#superclass : #TestCase,
	#category : #'MicroKanren-Tests'
}

{ #category : #tests }
LittleProverTest >> test_01_19 [
	self
		assert: [ :a :b | #flapjack = (a cons: b) isAtom ] sourceNode body
		equals: [ :a :b | #flapjack = false ]
]
