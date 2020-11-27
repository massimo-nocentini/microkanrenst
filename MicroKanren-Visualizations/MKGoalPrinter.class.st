Class {
	#name : #MKGoalPrinter,
	#superclass : #Object,
	#instVars : [
		'unified',
		'state',
		'path',
		'associations',
		'innerVariables'
	],
	#category : #'MicroKanren-Visualizations'
}

{ #category : #accessing }
MKGoalPrinter >> associations [

	^ associations
]

{ #category : #initialization }
MKGoalPrinter >> initialize [

	unified := IdentitySet new.
	innerVariables := IdentityDictionary new
]

{ #category : #printing }
MKGoalPrinter >> printClause: anAssociation on: aStream [

	aStream nextPut: $(.
	anAssociation key printOn: aStream renderer: self.
	aStream nextPutAll: ' → '.
	anAssociation value printOn: aStream renderer: self.
	aStream nextPut: $)
]

{ #category : #printing }
MKGoalPrinter >> printOn: aStream aCond: aCond [

	aCond clauses ifNotEmpty: [ :clauses | 
		clauses allButLastDo: [ :each | 
			self printClause: each on: aStream.
			aStream
				nextPutAll: ';° ';
				crlf ].
		self printClause: clauses last on: aStream ]
]

{ #category : #printing }
MKGoalPrinter >> printOn: aStream aConj: aConj [

	aStream nextPut: $(.
	aConj both printOn: aStream renderer: self.
	aStream nextPutAll: ') &° ('.
	aConj and printOn: aStream renderer: self.
	aStream nextPut: $)
]

{ #category : #printing }
MKGoalPrinter >> printOn: aStream aDisj: aDisj [

	aStream nextPut: $(.
	aDisj either printOn: aStream renderer: self.
	aStream nextPutAll: ') |° ('.
	aDisj or printOn: aStream renderer: self.
	aStream nextPut: $)
]

{ #category : #printing }
MKGoalPrinter >> printOn: aStream aFailed: aGoal [

	aStream nextPutAll: 'Ø°'
]

{ #category : #printing }
MKGoalPrinter >> printOn: aStream aFresh: aGoal [

	aGoal variables ifNotEmpty: [ :variables | 
		aStream nextPut: $!.
		variables allButLastDo: [ :each | 
			each printOn: aStream.
			aStream nextPut: Character space ].
		variables last printOn: aStream.
		aStream nextPutAll: '. ' ].
	aGoal innerGoal
		variables: (innerVariables at: aGoal);
		printOn: aStream renderer: self
	"aGoal receiver in: [ :aBlock | 
		| mapping sourceCode |
		mapping := Dictionary new.
		aGoal variables
			with: aBlock argumentNames
			do: [ :variable :name | mapping at: name put: variable ].
		sourceCode := aBlock sourceNode body in: [ :bodyNode | 
			              bodyNode allVariables do: [ :each | 
				              mapping
					              at: each name
					              ifPresent: [ :aVar | each name: aVar asString ] ].
			              bodyNode formattedCode ].
		aStream nextPutAll: sourceCode ]"
]

{ #category : #printing }
MKGoalPrinter >> printOn: aStream aPredicateBinary: aPredicate [

	self printOn: aStream aPredicateUnary: aPredicate.
	aStream nextPut: Character space.
	aPredicate secondArgument printOn: aStream
]

{ #category : #'as yet unclassified' }
MKGoalPrinter >> printOn: aStream aPredicateTernary: aPredicate [

	self printOn: aStream aPredicateBinary: aPredicate.
	aStream nextPut: Character space.
	aPredicate thirdArgument printOn: aStream
]

{ #category : #printing }
MKGoalPrinter >> printOn: aStream aPredicateUnary: aPredicate [

	aStream nextPutAll: aPredicate name.
	aStream nextPut: Character space.
	aPredicate firstArgument printOn: aStream
]

{ #category : #printing }
MKGoalPrinter >> printOn: aStream aSucceed: aSucceed [

	aStream nextPutAll: '✓°'
]

{ #category : #printing }
MKGoalPrinter >> printOn: aWriteStream aVar: aVar [

	(unified includes: aVar)
		ifTrue: [ 
			| walked |
			walked := state walker value: aVar.
			aVar == walked
				ifTrue: [ self printOn: aWriteStream anObject: aVar ]
				ifFalse: [ walked printOn: aWriteStream renderer: self ] ]
		ifFalse: [ self printOn: aWriteStream anObject: aVar ]
]

{ #category : #printing }
MKGoalPrinter >> printOn: aStream anEta: anEta [

	aStream nextPut: $[.
	anEta innerGoal printOn: aStream renderer: self.
	aStream nextPutAll: ']°'
]

{ #category : #printing }
MKGoalPrinter >> printOn: aStream anIfPure: anIfPure [

	aStream nextPutAll: 'if '.
	anIfPure question printOn: aStream renderer: self.
	aStream
		crlf;
		nextPutAll: ' then '.
	anIfPure answer printOn: aStream renderer: self.
	aStream
		crlf;
		nextPutAll: ' else '.
	anIfPure otherwise printOn: aStream renderer: self
]

{ #category : #printing }
MKGoalPrinter >> printOn: aWriteStream anObject: anObject [

	anObject printOn: aWriteStream
]

{ #category : #printing }
MKGoalPrinter >> printOn: aStream anUnify: anUnify [

	anUnify this printOn: aStream renderer: self.
	aStream nextPutAll: ' =° '.
	anUnify that printOn: aStream renderer: self
]

{ #category : #accessing }
MKGoalPrinter >> state: anObject [

	state := anObject
]

{ #category : #evaluating }
MKGoalPrinter >> value [

	path := state path reversed asLinkedList.
	path overlappingPairsDo: [ :g :g_succ | 
		innerVariables at: g put: g_succ variables ].
	associations := path collect: [ :aGoal | 
		                | aString |
		                aString := String streamContents: [ :aStream | 
			                           aGoal printOn: aStream renderer: self ].
		                "Dispatch over aGoal in order to mark two subgoals 
								  as unified if aGoal can do that."
		                aGoal addUnifiedSubgoalsInSet: unified.
		                "Finally return an association with the computed text"
		                aGoal -> aString ]
]
