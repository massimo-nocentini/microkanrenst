Extension { #name : #LinkedList }

{ #category : #'*MicroKanren-core' }
LinkedList >> , other [
	"Optimized version of append for this specific linked container"

	^ other
		ifEmpty: [ self ]
		ifNotEmpty: [ self
				addLast: other firstLink;
				yourself ]
]

{ #category : #'*MicroKanren-core' }
LinkedList >> allButFirst [
	^ self cdr
]

{ #category : #'*MicroKanren-core' }
LinkedList >> bind: aGoal [
	^ Bind combine: aGoal with: self
]

{ #category : #'*MicroKanren-core' }
LinkedList >> car [
	"Return the very first element"

	^ self first
]

{ #category : #'*MicroKanren-core' }
LinkedList >> cdr [
	"Returns the tail of this list"

	^ self
		ifNotEmpty: [ firstLink nextLink
				ifNil: [ self class new ]
				ifNotNil: [ :nl | self class with: nl ] ]
]

{ #category : #'*MicroKanren-core' }
LinkedList >> mplus: aCollection [
	^ MPlus with: self with: aCollection
]

{ #category : #'*MicroKanren-core' }
LinkedList >> reifyUsingReifier: aReifier [ 
	^ aReifier forLinkedList: self 
]

{ #category : #'*MicroKanren-core' }
LinkedList >> unifyWith: another usingUnifier: anUnifier [
	^ another unifyWithLinkedList: self usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-core' }
LinkedList >> unifyWithLinkedList: aCollection usingUnifier: anUnifier [ 
	^ anUnifier forLinkedList: self forLinkedList: aCollection
]

{ #category : #'*MicroKanren-core' }
LinkedList >> walkStarUsingWalker: aWalker [
	^ aWalker forLinkedList: self 
]
