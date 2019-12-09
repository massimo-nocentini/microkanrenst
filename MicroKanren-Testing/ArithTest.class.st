Class {
	#name : #ArithTest,
	#superclass : #Srfi41AbstractTest,
	#category : #'MicroKanren-Testing'
}

{ #category : #'as yet unclassified' }
ArithTest >> testAddero [
	| g µ |
	µ := Theory arith.
	g := [ :x :y :r | µ addero !! {0. x. y. r} ] fresh.
	self
		assert:
			{{0 asReifiedVar. 0 asConsedBinaryRepr.	0 asReifiedVar}.
			{0 asConsedBinaryRepr.	(0 asReifiedVar cons: 1 asReifiedVar). (0 asReifiedVar cons: 1 asReifiedVar)}.
			({1 . 1 . 2} collect: #asConsedBinaryRepr)}
		equals: (g solutions next: 3)
		modulo: #asOrderedCollection
]

{ #category : #'as yet unclassified' }
ArithTest >> testBitAndo [
	| g µ |
	µ := Theory arith.
	g := [:x :y | µ bitAndo !!	{x . y . 1}] fresh.
	self assert:  g solutions equals: {{1 . 1}} modulo: #asOrderedCollection
]

{ #category : #'as yet unclassified' }
ArithTest >> testBitXoro [
	| g µ |
	µ := Theory arith.
	g := [:x :y | µ bitXoro !! {x . y . 0}] fresh.
	self assert: g solutions equals: {{0. 0}. {1. 1}} modulo: #asOrderedCollection
]

{ #category : #'as yet unclassified' }
ArithTest >> testFullAddero [
	| g µ |
	µ := Theory arith.
	g := [:x :y | µ bitFullAddero !! {0. 1. 1. x. y}] fresh.
	self assert: g solutions equals: {{0. 1}} modulo: #asOrderedCollection .
	g := µ bitFullAddero fresh.
	self assert: g solutions 
			equals: {#(0 0 0 0 0). #(0 0 1 1 0). #(1 0 0 1 0). #(0 1 0 1 0). 
					  #(1 0 1 0 1). #(0 1 1 0 1). #(1 1 0 0 1). #(1 1 1 1 1)}
			modulo: #asOrderedCollection 
]

{ #category : #'as yet unclassified' }
ArithTest >> testGreaterThanOneo [
	| g µ |
	µ := Theory arith.
	g := µ greaterThanOneo value: 6 asConsedBinaryRepr.
	self assert: {Var tautology} equals: g solutions contents.
	g := µ greaterThanOneo value: 1 asConsedBinaryRepr.
	self assert: {} equals: g solutions contents.
	g := µ greaterThanOneo value: 0 asConsedBinaryRepr.
	self assert: {} equals: g solutions contents.
	g := µ greaterThanOneo fresh.
	self assert: {(0
			cons: (1 cons: 2))
			collect: #asReifiedVar} equals: g solutions contents
]

{ #category : #'as yet unclassified' }
ArithTest >> testHalfAddero [
	| g µ |
	µ := Theory arith.
	g := [:x :y | µ bitHalfAddero
				value: x
				value: 1
				value: y
				value: 1] fresh.
	self assert: {{1. 0}} equals: g solutions contents.
	g := µ bitHalfAddero fresh.
	self assert: {#(0 0 0 0). #(0 1 1 0). #(1 0 1 0). #(1 1 0 1)} equals: g solutions contents
]

{ #category : #'as yet unclassified' }
ArithTest >> testMinuso [
	| g µ |
	µ := Theory arith.
	g := [:x | µ minuso
				value: 8 asConsedBinaryRepr
				value: 5 asConsedBinaryRepr
				value: x] fresh.
	self assert: {3 asConsedBinaryRepr} equals: g solutions contents.
	g := [:x | µ minuso
				value: 6 asConsedBinaryRepr
				value: 8 asConsedBinaryRepr
				value: x] fresh.
	self assert: {} equals: g solutions contents
]

{ #category : #'as yet unclassified' }
ArithTest >> testPluso [
	| g µ |
	µ := Theory arith.
	g := [:x :y | µ pluso valueWithArguments: {x. y. 5 asConsedBinaryRepr}] fresh.
	self
		assert: ({{5. 0}. {0. 5}. {1. 4}. {4. 1}. {2. 3}. {3. 2}}
				collect: [:each | each collect: #asConsedBinaryRepr])
		equals: g solutions contents
]

{ #category : #'as yet unclassified' }
ArithTest >> testPositiveo [
	| g µ |
	µ := Theory arith.
	g := µ positiveo value: 6 asConsedBinaryRepr.
	self assert: {Var tautology} equals: g solutions contents.
	g := µ positiveo value: 1 asConsedBinaryRepr.
	self assert: {Var tautology} equals: g solutions contents.
	g := µ positiveo value: 0 asConsedBinaryRepr.
	self assert: {} equals: g solutions contents
]

{ #category : #'as yet unclassified' }
ArithTest >> testSucco [
	| g µ |
	µ := Theory arith.
	g := µ succo value: 0 asConsedBinaryRepr value: 1 asConsedBinaryRepr.
	self assert: {Var tautology} equals: g solutions contents.
	g := µ succo value: 4 asConsedBinaryRepr value: 5 asConsedBinaryRepr.
	self assert: {Var tautology} equals: g solutions contents.
	g := µ succo value: (1 << 30 - 1) asConsedBinaryRepr value: (1 << 30) asConsedBinaryRepr.
	self assert: {Var tautology} equals: g solutions contents
]
