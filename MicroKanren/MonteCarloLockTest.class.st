Class {
	#name : #MonteCarloLockTest,
	#superclass : #TestCase,
	#category : 'MicroKanren-testing'
}

{ #category : #tests }
MonteCarloLockTest >> testFirstMachine [
	"McCulloch's first machine"
	| g µ|
	µ := Theory montecarloLock.
	g := [:a | µ mccullocho value: a value: a] fresh.
	self assert: (g solutions next: 1) contents equals: {#(3 2 3) asCons}.
	"Montecarlo lock"
	g := [:a | µ mclocko value: a value: a] fresh.
	self
		assert: ((g solutions next: 1) contents collect: #asLinkedList)
		equals: {#(5 4 6 4 2 5 4 6 4 2)}
]

{ #category : #tests }
MonteCarloLockTest >> testSimpleRules [
	| g µ|
	µ := Theory montecarloLock.
	g := µ mccullocho value: #(2 3) asCons value: #(3) asCons.
	self assert: g solutions contents equals: {Var tautology}.
	g := µ mccullocho value: #(3 2 4 2) asCons value: #(4 2 2 4 2) asCons.
	self assert: g solutions contents equals: {Var tautology}.
	g := µ mccullocho value: #(3 4 2) asCons value: #(4 2 2 4 2) asCons.
	self assert: g solutions contents equals: {}
]
