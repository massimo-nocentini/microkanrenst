Extension { #name : #LinkedList }

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
