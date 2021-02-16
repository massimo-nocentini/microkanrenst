Extension { #name : #RBNode }

{ #category : #'*MicroKanren-RB' }
RBNode >> asRBNode [

	^ self
]

{ #category : #'*MicroKanren-RB' }
RBNode >> printOn: aWriteStream renderer: aMKComputationTreeRenderer [

	aMKComputationTreeRenderer printOn: aWriteStream aRBNode: self
]

{ #category : #'*MicroKanren-RB' }
RBNode >> reifyUsingReifier: aReifier [

	^ aReifier forRBNode: self
]

{ #category : #'*MicroKanren-RB' }
RBNode >> sendso [

	^ [ :anObject | 
	  RBProgramNodeSendsoVisitor new
		  selectorVar: anObject;
		  visitNode: self;
		  asGoal ]
]

{ #category : #'*MicroKanren-RB' }
RBNode >> substituteVariablesUsingDictionary: aDict [

	^ self acceptVisitor: (RBProgramNodeSubstitutionVisitor new
			   substitution: aDict;
			   yourself)
]

{ #category : #'*MicroKanren-RB' }
RBNode >> unifyWith: anObject usingUnifier: anUnifier [

	self subclassResponsibility
]

{ #category : #'*MicroKanren-RB' }
RBNode >> unifyWithRBBlockNode: aNode usingUnifier: anUnifier [

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
RBNode >> unifyWithRBLiteralValueNode: aNode usingUnifier: anUnifier [

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
RBNode >> unifyWithRBLogicVariableNode: aNode usingUnifier: anUnifier [

	^ aNode unifyWithRBNode: self usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
RBNode >> unifyWithRBMessageNode: aNode usingUnifier: anUnifier [

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
RBNode >> unifyWithRBNode: aNode usingUnifier: anUnifier [

	^ self unifyWithObject: aNode usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
RBNode >> unifyWithRBSelectorNode: aNode usingUnifier: anUnifier [

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
RBNode >> unifyWithRBSequenceNode: aNode usingUnifier: anUnifier [

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
RBNode >> walkStarUsingWalker: aWalker [

	^ aWalker forRBNode: self
]
