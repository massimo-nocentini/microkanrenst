"
A RBProgramNodeIdentityVisitorTest is a test class for testing the behavior of RBProgramNodeIdentityVisitor
"
Class {
	#name : #RBProgramNodeIdentityVisitorTest,
	#superclass : #TestCase,
	#category : #'MicroKanren-Tests'
}

{ #category : #tests }
RBProgramNodeIdentityVisitorTest >> testFirstExampleOfLittleProver [
	self
		assert:
			([ :x | 
			[ :a :b | 
			| f |
			#flapjack = (a ~~> x) isAtom ] ] sourceNode body
				acceptVisitor: RBProgramNodeIdentityVisitor new)
		equals:
			[ :x | 
			[ :a :b | 
			| f |
			#flapjack = (a ~~> x) isAtom ] ] sourceNode body
]

{ #category : #tests }
RBProgramNodeIdentityVisitorTest >> testFirstExampleOfLittleProverWithLogicVars [
	self
		deny:
			[ :x | 
			[ :a :b | 
			| f |
			#flapjack = (a ~~> x) isAtom ] ] context
		equals:
			[ :x | 
			[ :a :b | 
			| f |
			#flapjack = (a ~~> x) isAtom ] ] sourceNode body
]
