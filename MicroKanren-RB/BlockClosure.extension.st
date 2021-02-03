Extension { #name : #BlockClosure }

{ #category : #'*MicroKanren-RB' }
BlockClosure >> asGoalWithASTof: aBlock [

	^ self asGoalWithASTof: aBlock select: #yourself
]

{ #category : #'*MicroKanren-RB' }
BlockClosure >> asGoalWithASTof: aBlock select: selectBlock [

	^ FreshRB new
		  receiver: aBlock;
		  nodeBlock: self;
		  selectBlock: selectBlock;
		  yourself
]

{ #category : #'*MicroKanren-RB' }
BlockClosure >> asGoalWithUnaryASTof: aBlock [

	^ self asGoalWithASTof: aBlock select: [ :aSequenceNode | 
		  aSequenceNode statements in: [ :statements | 
			  statements size = 1
				  ifTrue: [ statements first ]
				  ifFalse: [ 
					  Error signal:
						  ('Assumption that {} has 1 statement only is violated.' 
							   format: { aSequenceNode }) ] ] ]
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

{ #category : #'*MicroKanren-RB' }
BlockClosure >> unaryRBNode [

	^ self sourceNode body statements in: [ :statements | 
		  statements size = 1
			  ifTrue: [ statements first ]
			  ifFalse: [ 
				  Error signal:
					  ('Assumption that {} has 1 statement only is violated.' 
						   format: { self }) ] ]
]
