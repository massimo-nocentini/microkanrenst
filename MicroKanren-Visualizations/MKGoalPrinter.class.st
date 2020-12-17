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
MKGoalPrinter >> printOn: aStream aCut: aGoal [

	aStream nextPut: $(.
	aGoal cuttingGoal printOn: aStream renderer: self.
	aStream nextPutAll: ') !°'
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

	state path value == aGoal
		ifTrue: [ 
			state
				ifCounterexampleFound: [ :ce | 
					ce left printOn: aStream.
					aStream nextPutAll: ' ≠ '.
					ce right printOn: aStream ]
				otherwise: [ aStream nextPutAll: 'Ø°' ] ]
		ifFalse: [ aStream nextPutAll: 'Ø°' ]
]

{ #category : #printing }
MKGoalPrinter >> printOn: aStream aFresh: aGoal [

	aGoal variables
		ifNil: [ aStream nextPutAll: '…º' ]
		ifNotNil: [ :variables | 
			aStream nextPut: $!.
			variables ifEmpty: [ Error signal ] ifNotEmpty: [ 
				variables allButLastDo: [ :each | 
					each printOn: aStream.
					aStream nextPut: Character space ].
				aStream nextPutAll: variables last asString.
				aStream nextPutAll: '. ' ].
			aGoal printOnNestedGoalOn: aStream renderer: self ]
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

	state path value == aSucceed
		ifTrue: [ 
			state reifyTopmostVariables
				ifEmpty: [ aStream nextPutAll: '✓°' ]
				ifNotEmpty: [ :assocs | 
					assocs do: [ :each | 
						each value printOn: aStream.
						aStream nextPut: $/.
						each key printOn: aStream.
						aStream crlf ] ] ]
		ifFalse: [ aStream nextPutAll: '✓°' ]
]

{ #category : #printing }
MKGoalPrinter >> printOn: aWriteStream aVar: aVar [

	"(unified includes: aVar)
		ifTrue: [ 
			| walked |
			walked := state walker value: aVar.
			aVar == walked
				ifTrue: [ self printOn: aWriteStream anObject: aVar ]
				ifFalse: [ walked printOn: aWriteStream renderer: self ] ]
		ifFalse: [ self printOn: aWriteStream anObject: aVar ]"

	self printOn: aWriteStream anObject: aVar
]

{ #category : #printing }
MKGoalPrinter >> printOn: aStream anEta: anEta [

	aStream nextPut: $[.
	anEta printOnNestedGoalOn: aStream renderer: self.
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
MKGoalPrinter >> printOn: aStream anUnify: aGoal [

	aGoal left printOn: aStream renderer: self.
	aStream nextPutAll: ' =° '.
	aGoal right printOn: aStream renderer: self
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
