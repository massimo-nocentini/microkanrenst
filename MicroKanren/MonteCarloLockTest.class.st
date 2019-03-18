Class {
	#name : #MonteCarloLockTest,
	#superclass : #TestCase,
	#category : 'MicroKanren-testing'
}

{ #category : #initializing }
MonteCarloLockTest >> mcculloch [
	^ InductiveRelationsTheory new
		rules:
			{McCullochAssociateRule new.
			McCullochIdentityRule new};
		yourself
]

{ #category : #initializing }
MonteCarloLockTest >> mclock [
	^ InductiveRelationsTheory new
		rules:
			{McCullochRepeatRule new.
			McCullochReverseRule new.
			McCullochRightHalfAssociateRule new.
			McCullochShrinkRule new};
		yourself
]

{ #category : #tests }
MonteCarloLockTest >> testFirstMachine [
	"McCulloch's first machine"
	| g |
	g := [:a | self mcculloch proves: a relates: a] fresh.
	self
		assert: (g solutions atMost: 1)
		equals: {#(3 2 3) asCons}.
	"Montecarlo lock"
	g := [:a | self mclock proves: a relates: a] fresh.
	self
		assert: ((g solutions atMost: 1)
				collect: #asLinkedList)
		equals: {#(5 4 6 4 2 5 4 6 4 2)}
]

{ #category : #tests }
MonteCarloLockTest >> testSimpleRules [
	| g |
	g := self mcculloch proves: #(2 3) asCons relates: #(3) asCons.
	self assert: g solutions all equals: {Var tautology}.
	g := self mcculloch proves: #(3 2 4 2) asCons relates: #(4 2 2 4 2) asCons.
	self assert: g solutions all equals: {Var tautology}.
	g := self mcculloch proves: #(3 4 2) asCons relates: #(4 2 2 4 2) asCons.
	self assert: g solutions all equals: {}
]
