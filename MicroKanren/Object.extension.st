Extension { #name : #Object }

{ #category : #'*MicroKanren-core' }
Object >> cons: anObj [
	^ anObj consedObject: self
]

{ #category : #'*MicroKanren-core' }
Object >> equalVar: aReifiedVar [
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

	^ Unify new
		  left: self;
		  right: another;
		  yourself
]

{ #category : #'*MicroKanren-core' }
Object >> unifyWith: another usingUnifier: anUnifier [

	^ another unifyWithObject: self usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-core' }
Object >> unifyWithCons: aCons usingUnifier: anUnifier [

	^ self unifyWithObject: aCons usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-core' }
Object >> unifyWithObject: anObj usingUnifier: anUnifier [

	^ anUnifier forObject: self forObject: anObj
]

{ #category : #'*MicroKanren-core' }
Object >> unifyWithSequenceableCollection: aCollection usingUnifier: anUnifier [

	^ self unifyWithObject: aCollection usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-core' }
Object >> unifyWithVar: aVar usingUnifier: anUnifier [

	^ anUnifier forVar: aVar forObject: self
]

{ #category : #'*MicroKanren-core' }
Object >> unifyo [
	^ [:anObject | self unifyWith: anObject]
]

{ #category : #'*MicroKanren' }
Object >> walkSBRAL: aSBRAL forState: aState [

	^ aState walkObject: self inSBRAL: aSBRAL
]

{ #category : #'*MicroKanren-core' }
Object >> walkStarUsingWalker: aWalker [
	^ aWalker forObject: self 
]

{ #category : #'*MicroKanren-core' }
Object >> zeroo [
	^ Theory arith zeroo value: self
]
