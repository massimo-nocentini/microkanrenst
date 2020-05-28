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

{ #category : #'as yet unclassified' }
RBProgramNodeIdentityVisitorTest >> thm_atom_cons [
	^ [ :x :y | 
	[ :v :z | 
	| match then |
	match := x unifyo
		value:
			(RBMessageNode
				receiver:
					(RBMessageNode
						receiver: v asRBMKVarNode
						selector: #cons:
						arguments: z asRBMKVarNode)
				selector: #isAtom).
	then := y unifyo value: (RBLiteralValueNode value: false) ] fresh ]
]
