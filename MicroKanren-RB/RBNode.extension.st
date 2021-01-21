Extension { #name : #RBNode }

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
RBNode >> walkStarUsingWalker: aWalker [

	^ aWalker forRBNode: self
]
