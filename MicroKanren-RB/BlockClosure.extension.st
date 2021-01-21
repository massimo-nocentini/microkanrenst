Extension { #name : #BlockClosure }

{ #category : #'*MicroKanren-RB' }
BlockClosure >> asGoalWithASTof: aBlock [

	^ FreshRB new
		  receiver: aBlock;
		  nodeBlock: self;
		  yourself
]

{ #category : #'*MicroKanren-RB' }
BlockClosure >> context [
	^ self sourceNode body
		acceptVisitor:
			(RBProgramNodeSubstitutionVisitor new
				substitution:
					(Dictionary new
						at: #x
							put:
							(RBLogicVariableNode new
								logicVar: 3;
								yourself);
						yourself);
				yourself)
]

{ #category : #'*MicroKanren-RB' }
BlockClosure >> sendso [

	^ self sourceNode body sendso
]
