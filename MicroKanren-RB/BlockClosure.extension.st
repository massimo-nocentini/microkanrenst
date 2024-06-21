Extension { #name : 'BlockClosure' }

{ #category : '*MicroKanren-RB' }
BlockClosure >> <~> aBlock [

	^ [ :a :b | 
	  [ :ast | 
	  [ :x | 
	  | z |
	  z := aBlock substituteVariablesUsingSequenceableCollection:
		       (Array with: x asRBNode).
	  (ast unifyo value: a) , (z unifyo value: b) ] ]
		  asGoalWithUnaryASTof: self
		  contextVariables: #(  ) ]
]

{ #category : '*MicroKanren-RB' }
BlockClosure >> <~~> aBlock [

	^ [ :a :b | 
	  [ :ast | 
	  [ :x :y | 
	  | z |
	  z := aBlock substituteVariablesUsingSequenceableCollection:
		       (Array with: x asRBNode with: y asRBNode).
	  (ast unifyo value: a) , (z unifyo value: b) ] ]
		  asGoalWithUnaryASTof: self
		  contextVariables: #(  ) ]
]

{ #category : '*MicroKanren-RB' }
BlockClosure >> <~~~> aBlock [

	^ [ :a :b | 
	  [ :ast | 
	  [ :x :y :w | 
	  | z |
	  z := aBlock substituteVariablesUsingSequenceableCollection:
		       (Array with: x asRBNode with: y asRBNode with: w asRBNode).
	  (ast unifyo value: a) , (z unifyo value: b) ] ]
		  asGoalWithUnaryASTof: self
		  contextVariables: #(  ) ]
]

{ #category : '*MicroKanren-RB' }
BlockClosure >> asGoalWithASTof: aBlock [

	^ self asGoalWithASTof: aBlock select: #yourself
]

{ #category : '*MicroKanren-RB' }
BlockClosure >> asGoalWithASTof: aBlock contextVariables: aCollection select: selectBlock [

	^ FreshRB new
		  receiver: aBlock;
		  nodeBlock: self;
		  selectBlock: selectBlock;
		  contextVariables: aCollection;
		  yourself
]

{ #category : '*MicroKanren-RB' }
BlockClosure >> asGoalWithASTof: aBlock select: selectBlock [

	^ self
		  asGoalWithASTof: aBlock
		  contextVariables: #(  )
		  select: selectBlock
]

{ #category : '*MicroKanren-RB' }
BlockClosure >> asGoalWithUnaryASTof: aBlock contextVariables: aCollection [

	^ self
		  asGoalWithASTof: aBlock
		  contextVariables: aCollection
		  select: [ :aSequenceNode | 
			  aSequenceNode statements in: [ :statements | 
				  statements size = 1
					  ifTrue: [ statements first ]
					  ifFalse: [ 
						  Error signal:
							  ('Assumption that {} has 1 statement only is violated.' 
								   format: { aSequenceNode }) ] ] ]
]

{ #category : '*MicroKanren-RB' }
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

{ #category : '*MicroKanren-RB' }
BlockClosure >> sendso [

	^ self sourceNode body sendso
]

{ #category : '*MicroKanren-RB' }
BlockClosure >> substituteVariablesUsingSequenceableCollection: rbVariables [

	^ self unaryRBNode substituteVariablesUsingDictionary:
		  (self argumentNames with: rbVariables collect: #->) asDictionary
]

{ #category : '*MicroKanren-RB' }
BlockClosure >> unaryRBNode [

	^ self sourceNode body statements in: [ :statements | 
		  statements size = 1
			  ifTrue: [ statements first ]
			  ifFalse: [ 
				  Error signal:
					  ('Assumption that {} has 1 statement only is violated.' 
						   format: { self }) ] ]
]

{ #category : '*MicroKanren-RB' }
BlockClosure >> valueWithExitUnary [

	^ self value: [ :anObject | ^ anObject ]
]
