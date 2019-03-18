Extension { #name : #Object }

{ #category : #'*MicroKanren-core' }
Object >> asCons [
	^ Cons fromObject: self
]

{ #category : #'*MicroKanren-core' }
Object >> asCons: aCdr [
	^ Cons fromObject: self lastCdr: aCdr
]

{ #category : #'*MicroKanren-core' }
Object >> cons: anObj [
	^ anObj consedObject: self
]

{ #category : #'*MicroKanren-core' }
Object >> consedObject: car [
	^ Cons car: car asCons cdr: self asCons
]

{ #category : #'*MicroKanren-core' }
Object >> equalReifiedVar: aReifiedVar [
	^ false
]

{ #category : #'*MicroKanren-core' }
Object >> nilo [
	^ nil unifyWith: self
]

{ #category : #'*MicroKanren-core' }
Object >> reifyUsing: aReifier [
	^ aReifier reifyObject: self 
]

{ #category : #'*MicroKanren-core' }
Object >> unifyWith: another [
	^ Goal unify: self with: another
]

{ #category : #'*MicroKanren-core' }
Object >> unifyWith: another usingUnifier: anUnifier onState: aState [
	^ another unifyWithObject: self usingUnifier: anUnifier onState: aState
]

{ #category : #'*MicroKanren-core' }
Object >> unifyWithCons: aCons usingUnifier: anUnifier onState: aState [
	^ anUnifier unifyObject: self withObject: aCons onState: aState
]

{ #category : #'*MicroKanren-core' }
Object >> unifyWithLinkedList: aCollection usingUnifier: anUnifier onState: aState [
	self subclassResponsibility
]

{ #category : #'*MicroKanren-core' }
Object >> unifyWithObject: anObj usingUnifier: anUnifier onState: aState [
	^ anUnifier unifyObject: self withObject: anObj onState: aState
]

{ #category : #'*MicroKanren-core' }
Object >> unifyWithVar: aVar usingUnifier: anUnifier onState: aState [
	^ anUnifier unifyObject: self withVar: aVar onState: aState
]

{ #category : #'*MicroKanren-core' }
Object >> walkStarUsingWalker: aWalker [
	^ aWalker walkStarObject: self 
]
