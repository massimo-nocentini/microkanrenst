Extension { #name : #Cons }

{ #category : #'*MicroKanren' }
Cons >> acceptOccurChecker: aChecker [

	^ aChecker forCons: self
]

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
Cons >> unifyWithSequenceableCollection: aCollection usingUnifier: anUnifier [

	^ aCollection asCons unifyWithCons: self usingUnifier: anUnifier
]

{ #category : #'*MicroKanren' }
Cons >> walkStarUsingWalker: aWalker [
	^ aWalker forCons: self
]
