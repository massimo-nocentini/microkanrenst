Extension { #name : 'ASTNode' }

{ #category : '*MicroKanren-RB' }
ASTNode >> acceptOccurChecker: aChecker [

	^ aChecker forRBNode: self
]

{ #category : '*MicroKanren-RB' }
ASTNode >> asRBNode [

	^ self
]

{ #category : '*MicroKanren-RB' }
ASTNode >> printOn: aWriteStream renderer: aMKComputationTreeRenderer [

	aMKComputationTreeRenderer printOn: aWriteStream aRBNode: self
]

{ #category : '*MicroKanren-RB' }
ASTNode >> reifyUsingReifier: aReifier [

	^ aReifier forRBNode: self
]

{ #category : '*MicroKanren-RB' }
ASTNode >> sendso [

	^ [ :anObject | 
	  RBProgramNodeSendsoVisitor new
		  selectorVar: anObject;
		  visitNode: self;
		  asGoal ]
]

{ #category : '*MicroKanren-RB' }
ASTNode >> substituteVariablesUsingDictionary: aDict [

	^ self acceptVisitor: (RBProgramNodeSubstitutionVisitor new
			   substitution: aDict;
			   yourself)
]

{ #category : '*MicroKanren-RB' }
ASTNode >> unifyWith: anObject usingUnifier: anUnifier [

	self subclassResponsibility
]

{ #category : '*MicroKanren-RB' }
ASTNode >> unifyWithRBBlockNode: aNode usingUnifier: anUnifier [

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
ASTNode >> unifyWithRBLiteralValueNode: aNode usingUnifier: anUnifier [

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
ASTNode >> unifyWithRBLogicVariableNode: aNode usingUnifier: anUnifier [

	^ aNode unifyWithRBNode: self usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
ASTNode >> unifyWithRBMessageNode: aNode usingUnifier: anUnifier [

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
ASTNode >> unifyWithRBNode: aNode usingUnifier: anUnifier [

	^ self unifyWithObject: aNode usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
ASTNode >> unifyWithRBSelectorNode: aNode usingUnifier: anUnifier [

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
ASTNode >> unifyWithRBSequenceNode: aNode usingUnifier: anUnifier [

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
ASTNode >> walkStarUsingWalker: aWalker [

	^ aWalker forRBNode: self
]
