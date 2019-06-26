Class {
	#name : #ChainTest,
	#superclass : #TestCase,
	#category : 'MicroKanren-testing'
}

{ #category : #helpers }
ChainTest >> collatz: o [ 
	^ o cons: [o even
		ifTrue: [self collatz: o / 2]
		ifFalse: [self collatz: 3 * o + 1]]
		
]

{ #category : #helpers }
ChainTest >> fib: m fib: n [ 
	^ m cons: [self fib: n fib: m+n]
]

{ #category : #helpers }
ChainTest >> fibs [
	^ self fib: 0 fib: 1
]

{ #category : #helpers }
ChainTest >> gcd: m gcd: n [ 
	^ m cons: [n isZero
		ifTrue: [Chain with: m]
		ifFalse: [self gcd: n gcd: m \\ n]]
		
]

{ #category : #helpers }
ChainTest >> ints: i [ 
	^ i cons: [self ints: i + 1]
		
]

{ #category : #helpers }
ChainTest >> nats [
	^ self ints: 0
]

{ #category : #testing }
ChainTest >> testNumbers [
	self assert: Chain bottom contents equals: LinkedList new.
	self
		assert: (self nats next: 10) contents
		equals: (0 to: 9).
	self
		assert: (self zeroOneTwo next: 10) contents
		equals: (0 to: 2).
	self
		assert: (self zeroOneTwo next: 1) contents
		equals: (0 to: 0).
	self assert: (self fibs next: 10) contents equals: {0. 1. 1. 2. 3. 5. 8. 13. 21. 34}.
	self assert: ((self collatz: 10)
			next: 10) contents equals: {10. 5. 16. 8. 4. 2. 1. 4. 2. 1}.
	self assert: ((self gcd: 18 gcd: 32)
			next: 10) contents equals: {18. 32. 18. 14. 4. 2. 2}.
	self assert: ((Chain repeat: 4)
			next: 10) contents equals: {4. 4. 4. 4. 4. 4. 4. 4. 4. 4}
]

{ #category : #helpers }
ChainTest >> zeroOneTwo [
	^ 0
		cons: (1
				cons: (2 cons: Chain bottom))
]
