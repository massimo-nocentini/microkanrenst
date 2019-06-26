Extension { #name : #Cons }

{ #category : #'*MicroKanren' }
Cons >> reifyUsingReifier: aReifier [ 
	^ aReifier forCons: self 
]

{ #category : #'*MicroKanren' }
Cons >> unifyWith: another usingUnifier: anUnifier [
	^ another unifyWithCons: self usingUnifier: anUnifier
]

{ #category : #'*MicroKanren' }
Cons >> unifyWithCons: aCons usingUnifier: anUnifier [
	^ anUnifier forCons: self forCons: aCons
]

{ #category : #'*MicroKanren' }
Cons >> unifyWithLinkedList: aCollection usingUnifier: anUnifier [ 
	^ self unifyWith: aCollection asCons usingUnifier: anUnifier
]

{ #category : #'*MicroKanren' }
Cons >> walkStarUsingWalker: aWalker [
	^ aWalker forCons: self 
]
