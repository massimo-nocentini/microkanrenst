Extension { #name : 'OCNode' }

{ #category : '*MicroKanren-RB' }
OCNode >> acceptOccurChecker: aChecker [

	^ aChecker forRBNode: self
]

{ #category : '*MicroKanren-RB' }
OCNode >> asRBNode [

	^ self
]

{ #category : '*MicroKanren-RB' }
OCNode >> printOn: aWriteStream renderer: aMKComputationTreeRenderer [

	aMKComputationTreeRenderer printOn: aWriteStream aRBNode: self
]

{ #category : '*MicroKanren-RB' }
OCNode >> reifyUsingReifier: aReifier [

	^ aReifier forRBNode: self
]

{ #category : '*MicroKanren-RB' }
OCNode >> sendso [

	^ [ :anObject | 
	  RBProgramNodeSendsoVisitor new
		  selectorVar: anObject;
		  visitNode: self;
		  asGoal ]
]

{ #category : '*MicroKanren-RB' }
OCNode >> substituteVariablesUsingDictionary: aDict [

	^ self acceptVisitor: (RBProgramNodeSubstitutionVisitor new
			   substitution: aDict;
			   yourself)
]

{ #category : '*MicroKanren-RB' }
OCNode >> unifyWith: anObject usingUnifier: anUnifier [

	self subclassResponsibility
]

{ #category : '*MicroKanren-RB' }
OCNode >> unifyWithRBBlockNode: aNode usingUnifier: anUnifier [

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
OCNode >> unifyWithRBLiteralValueNode: aNode usingUnifier: anUnifier [

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
OCNode >> unifyWithRBLogicVariableNode: aNode usingUnifier: anUnifier [

	^ aNode unifyWithRBNode: self usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
OCNode >> unifyWithRBMessageNode: aNode usingUnifier: anUnifier [

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
OCNode >> unifyWithRBNode: aNode usingUnifier: anUnifier [

	^ self unifyWithObject: aNode usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
OCNode >> unifyWithRBSelectorNode: aNode usingUnifier: anUnifier [

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
OCNode >> unifyWithRBSequenceNode: aNode usingUnifier: anUnifier [

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
OCNode >> walkStarUsingWalker: aWalker [

	^ aWalker forRBNode: self
]
