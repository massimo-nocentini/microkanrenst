Class {
	#name : #ArithTest,
	#superclass : #Srfi41AbstractTest,
	#category : #'MicroKanren-Tests'
}

{ #category : #'as yet unclassified' }
ArithTest >> testAddero [
	| g µ |
	µ := Theory arith.
	g := [ :x :y :r | 
	µ addero
		!!
			{0.
			x.
			y.
			r} ] asGoal.
	[ :_0 :_1 | 
	self
		assert:
			{{_0.
			0 asConsedBinaryRepr.
			_0}.
			{0 asConsedBinaryRepr.
			(_0 cons: _1).
			(_0 cons: _1)}.
			({1.
			1.
			(1 + 1)} collect: #asConsedBinaryRepr)}
		equals: (g solutions next: 3)
		modulo: #asOrderedCollection ] withEnumeratedReifiedVars
]

{ #category : #'as yet unclassified' }
ArithTest >> testBitAndo [
	| g µ |
	µ := Theory arith.
	g := [:x :y | µ bitAndo !!	{x . y . 1}] asGoal.
	self assert:  g solutions equals: {{1 . 1}} modulo: #asOrderedCollection
]

{ #category : #'as yet unclassified' }
ArithTest >> testBitXoro [
	| g µ |
	µ := Theory arith.
	g := [:x :y | µ bitXoro !! {x . y . 0}] asGoal.
	self assert: g solutions equals: {{0. 0}. {1. 1}} modulo: #asOrderedCollection
]

{ #category : #'as yet unclassified' }
ArithTest >> testFullAddero [
	| g µ |
	µ := Theory arith.
	g := [:x :y | µ bitFullAddero !! {0. 1. 1. x. y}] asGoal.
	self assert: g solutions equals: {{0. 1}} modulo: #asOrderedCollection .
	g := µ bitFullAddero asGoal.
	self 
		assert: g solutions 
			equals: {#(0 0 0 0 0). #(0 0 1 1 0). #(1 0 0 1 0). #(0 1 0 1 0). 
					  #(1 0 1 0 1). #(0 1 1 0 1). #(1 1 0 0 1). #(1 1 1 1 1)}
			modulo: #asOrderedCollection 
]

{ #category : #'as yet unclassified' }
ArithTest >> testGreaterThanOneo [
	| g µ |
	µ := Theory arith.
	g := µ greaterThanOneo value: 6 asConsedBinaryRepr.
	self
		assert: g solutions
		equals: {Var tautology}
		modulo: #asOrderedCollection.
	g := µ greaterThanOneo value: 1 asConsedBinaryRepr.
	self assert: g solutions isEmpty.
	g := µ greaterThanOneo value: 0 asConsedBinaryRepr.
	self assert: g solutions isEmpty.
	g := µ greaterThanOneo asGoal.
	self
		assert: g solutions
		equals: {((0 cons: (1 cons: 2)) collect: #asReifiedVar)}
		modulo: #asOrderedCollection
]

{ #category : #'as yet unclassified' }
ArithTest >> testHalfAddero [
	| g µ |
	µ := Theory arith.
	g := [:x :y | µ bitHalfAddero !! { x . 1 . y . 1 }] asGoal.
	self assert: g solutions  equals: {{1. 0}} modulo: #asOrderedCollection.
	g := µ bitHalfAddero asGoal.
	self 
		assert: g solutions 
		equals: {#(0 0 0 0). #(0 1 1 0). #(1 0 1 0). #(1 1 0 1)}  
		modulo: #asOrderedCollection
]

{ #category : #'as yet unclassified' }
ArithTest >> testMinuso [
	| g µ |
	µ := Theory arith.
	g := [:x | µ minuso !! { 8 asConsedBinaryRepr . 5 asConsedBinaryRepr . x }] asGoal.
	self assert: g solutions equals: {3 asConsedBinaryRepr} modulo: #asOrderedCollection.
	g := [:x | µ minuso !! { 6 asConsedBinaryRepr . 8 asConsedBinaryRepr . x}] asGoal.
	self assert: g solutions isEmpty
]

{ #category : #'as yet unclassified' }
ArithTest >> testPluso [
	| g µ |
	µ := Theory arith.
	g := [:x :y | µ pluso valueWithArguments: {x. y. 5 asConsedBinaryRepr}] asGoal.
	self
		assert: g solutions
		equals: ({{5. 0}. {0. 5}. {1. 4}. {4. 1}. {2. 3}. {3. 2}}
					collect: [:each | each collect: #asConsedBinaryRepr])
		modulo: #asOrderedCollection
]

{ #category : #'as yet unclassified' }
ArithTest >> testPositiveo [
	| g µ |
	µ := Theory arith.
	g := µ positiveo value: 6 asConsedBinaryRepr.
	self assert: g solutions equals: {Var tautology} modulo: #asOrderedCollection.
	g := µ positiveo value: 1 asConsedBinaryRepr.
	self assert: g solutions equals: {Var tautology} modulo: #asOrderedCollection .
	g := µ positiveo value: 0 asConsedBinaryRepr.
	self assert: g solutions isEmpty
]

{ #category : #'as yet unclassified' }
ArithTest >> testSucco [
	| g µ |
	µ := Theory arith.
	g := µ succo value: 0 asConsedBinaryRepr value: 1 asConsedBinaryRepr.
	self assert: g solutions equals: {Var tautology}  modulo: #asOrderedCollection .
	g := µ succo value: 4 asConsedBinaryRepr value: 5 asConsedBinaryRepr.
	self assert: g solutions equals: {Var tautology}  modulo: #asOrderedCollection .
	g := µ succo value: (1 << 30 - 1) asConsedBinaryRepr value: (1 << 30) asConsedBinaryRepr.
	self assert: g solutions equals: {Var tautology}  modulo: #asOrderedCollection 
]
