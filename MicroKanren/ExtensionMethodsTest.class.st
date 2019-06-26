Class {
	#name : #ExtensionMethodsTest,
	#superclass : #TestCase,
	#category : 'MicroKanren-testing'
}

{ #category : #'about linked lists' }
ExtensionMethodsTest >> testAppend [
	| l1 l2 |
	l1 := LinkedList with: 1 with: 2 with: 3.
	l2 := LinkedList with: 4 with: 5 with: 6.
	self
		assert: l1 , l2
		equals:
			(LinkedList new
				add: 1;
				add: 2;
				add: 3;
				add: 4;
				add: 5;
				add: 6;
				yourself)
]

{ #category : #'about linked lists' }
ExtensionMethodsTest >> testCarCdr [
	"Tests about extension methods on LinkedList objects"

	| ll |
	ll := LinkedList with: #a with: #b.
	self
		assert: ll car equals: #a;
		assert: ll cdr car equals: #b;
		assert: ll cdr equals: (LinkedList with: #b);
		assert: ll cdr cdr equals: LinkedList new;
		assert: ll cdr cdr cdr equals: LinkedList new;
		should: [ ll cdr cdr car ] raise: Error
]

{ #category : #'about linked lists' }
ExtensionMethodsTest >> testCons [
	self assert: '(0)' equals: (0 cons: nil) asString.
	self assert: '(0 1 2 3 4 5 6 7 8 9)' equals: (0 to: 9) asCons asString.
	self assert: '((1 2) 3 4 (5 (6 8)) 7)' equals: {{1. 2}. 3. 4. {5. {6. 8}}. 7} asCons asString.
	"dotted pairs notation"
	self assert: '(0 . 1)' equals: (0 cons: 1) asString.
	self assert: '(0 1 2 3 4 5 6 7 8 9 . 10)' equals: ((0 to: 9)
			asConsWithCdr: 10) asString.
	self
		assert: '(((3 . 4) . 5) 6 7)'
		equals: (((3 cons: 4)
				cons: 5)
				cons: (6
						cons: (7 cons: nil))) asString
]

{ #category : #'about linked lists' }
ExtensionMethodsTest >> testGraph [
	| G |
	G := {#a -> #b. #b -> #c. #c -> #d. #d -> #a. #c -> #a} asGraph.
	self assert: {#b} equals: G vertices @ #a @ #outgoings.
	self assert: {#d . #c} equals: G vertices @ #a @ #incomings
]
