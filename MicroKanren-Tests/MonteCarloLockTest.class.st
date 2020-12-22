Class {
	#name : #MonteCarloLockTest,
	#superclass : #Srfi41AbstractTest,
	#category : #'MicroKanren-Tests'
}

{ #category : #tests }
MonteCarloLockTest >> testMcCullochMachine [
	| g  |
	g := [ :a | Theory montecarloLock mccullocho value: a value: a ] asGoal.
	self
		assert: (g solutions next: 1)
		equals: {#(3 2 3) asCons}
		modulo: #asOrderedCollection.
	
]

{ #category : #tests }
MonteCarloLockTest >> testMontecarloLockMachine [
	| g |
	g := [ :a | Theory montecarloLock mclocko value: a value: a ] asGoal.
	self
		assert: (g solutions next: 2)
		equals:
			{#(5 4 6 4 2 5 4 6 4 2) asCons.
			#(4 5 6 4 2 4 5 6 4 2) asCons}
		modulo: #asOrderedCollection
]

{ #category : #tests }
MonteCarloLockTest >> testSimpleRules [
	| g µ |
	µ := Theory montecarloLock.
	g := µ mccullocho value: #(2 3) asCons value: #(3) asCons.
	self
		assert: g solutions
		equals: {Var tautology}
		modulo: #asOrderedCollection.
	g := µ mccullocho value: #(3 2 4 2) asCons value: #(4 2 2 4 2) asCons.
	self
		assert: g solutions
		equals: {Var tautology}
		modulo: #asOrderedCollection.
	g := µ mccullocho value: #(3 4 2) asCons value: #(4 2 2 4 2) asCons.
	self assert: g solutions isEmpty
]
