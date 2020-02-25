Extension { #name : #Object }

{ #category : #'*MicroKanren-core' }
Object >> cons: anObj [
	^ anObj consedObject: self
]

{ #category : #'*MicroKanren-core' }
Object >> equalReifiedVar: aReifiedVar [
	^ false
]

{ #category : #'*MicroKanren-core' }
Object >> greaterThanOneo [
	^ Theory arith greaterThanOneo value: self
]

{ #category : #'*MicroKanren-core' }
Object >> isAlphaEquivalentTo: y inState: aState [
	| values |
	values := aState reifier reifyVars: {self. y}.
	^ values first = values second
]

{ #category : #'*MicroKanren-core' }
Object >> isVar [
	^ false
]

{ #category : #'*MicroKanren-core' }
Object >> nilo [
	^ Theory sexp nilo value: self
]

{ #category : #'*MicroKanren-core' }
Object >> oneo [
	^ Theory arith oneo value: self
]

{ #category : #'*MicroKanren-core' }
Object >> pairo [
	^ Theory sexp pairo value: self
]

{ #category : #'*MicroKanren-core' }
Object >> positiveo [
	^ Theory arith positiveo value: self
]

{ #category : #'*MicroKanren-core' }
Object >> reifyUsingReifier: aReifier [
	^ aReifier forObject: self 
]

{ #category : #'*MicroKanren-core' }
Object >> unifyWith: another [
	^ Goal unify: self with: another
]

{ #category : #'*MicroKanren-core' }
Object >> unifyWith: another usingUnifier: anUnifier [
	^ another unifyWithObject: self usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-core' }
Object >> unifyWithCons: aCons usingUnifier: anUnifier [
	^ anUnifier forObject: self forObject: aCons
]

{ #category : #'*MicroKanren-core' }
Object >> unifyWithLinkedList: aCollection usingUnifier: anUnifier [
	self subclassResponsibility
]

{ #category : #'*MicroKanren-core' }
Object >> unifyWithObject: anObj usingUnifier: anUnifier [
	^ anUnifier forObject: self forObject: anObj
]

{ #category : #'*MicroKanren-core' }
Object >> unifyWithVar: aVar usingUnifier: anUnifier [ 
	^ anUnifier forObject: self forVar: aVar 
]

{ #category : #'*MicroKanren-core' }
Object >> unifyo [
	^ [:anObject | self unifyWith: anObject]
]

{ #category : #'*MicroKanren-core' }
Object >> walkStarUsingWalker: aWalker [
	^ aWalker forObject: self 
]

{ #category : #'*MicroKanren-core' }
Object >> zeroo [
	^ Theory arith zeroo value: self
]
