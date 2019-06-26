Class {
	#name : #ExtensionMethodsTest,
	#superclass : #TestCase,
	#category : #'MicroKanren-Testing'
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
