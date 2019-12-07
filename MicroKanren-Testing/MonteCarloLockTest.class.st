Class {
	#name : #MonteCarloLockTest,
	#superclass : #Srfi41AbstractTest,
	#category : #'MicroKanren-Testing'
}

{ #category : #tests }
MonteCarloLockTest >> testFirstMachine [
	"McCulloch's first machine"

	| g µ |
	µ := Theory montecarloLock.
	g := [ :a | µ mccullocho value: a value: a ] fresh.
	self
		assert: (g solutions next: 1)
		equals: {#(3 2 3) asCons}
		modulo: #asOrderedCollection.
	"Montecarlo lock"
	g := [ :a | µ mclocko value: a value: a ] fresh.
	self
		assert: ((g solutions collect: #asOrderedCollection) next: 1)
		equals: {#(5 4 6 4 2 5 4 6 4 2)}
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
