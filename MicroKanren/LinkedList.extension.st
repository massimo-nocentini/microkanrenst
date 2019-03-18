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
LinkedList >> reifyUsing: aReifier [ 
	^ aReifier reifyLinkedList: self 
]

{ #category : #'*MicroKanren-core' }
LinkedList >> unifyWith: another usingUnifier: anUnifier onState: aState [
	^ another unifyWithLinkedList: self usingUnifier: anUnifier onState: aState
]

{ #category : #'*MicroKanren-core' }
LinkedList >> unifyWithLinkedList: aCollection usingUnifier: anUnifier onState: aState [
	^ anUnifier unifyLinkedList: self withLinkedList: aCollection onState: aState
]

{ #category : #'*MicroKanren-core' }
LinkedList >> walkStarUsingWalker: aWalker [
	^ aWalker walkStarLinkedList: self 
]

{ #category : #'*MicroKanren-core' }
LinkedList >> zip: aSequenceable [
	^ self zip: aSequenceable with: [ :s :o | s -> o ]
]

{ #category : #'*MicroKanren-core' }
LinkedList >> zip: aSequenceable with: aBlock [
	| l |
	l := self class new.
	1 to: (self size min: aSequenceable size) do: [ :i | 
		| v |
		v := aBlock value: (self at: i) value: (aSequenceable at: i).
		l add: v ].
	^ l
]
