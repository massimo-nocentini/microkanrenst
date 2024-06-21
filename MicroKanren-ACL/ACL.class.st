"
A Computational Logic.
"
Class {
	#name : 'ACL',
	#superclass : 'Object',
	#instVars : [
		'steps',
		'node',
		'lastBlock',
		'contextVariables',
		'freshContextVariables'
	],
	#category : 'MicroKanren-ACL',
	#package : 'MicroKanren-ACL'
}

{ #category : 'accessing' }
ACL >> argumentNames [

	^ (1 to: steps size + contextVariables size) collect: [ :each | 
		  '§' , each asString subscript ]
]

{ #category : 'initialization' }
ACL >> asGoal [

	^ Fresh new
		  receiver: self;
		  yourself
]

{ #category : 'accessing' }
ACL >> contextVariables: anObject [

	contextVariables := anObject
]

{ #category : 'initialization' }
ACL >> focus: focusBlock do: doBlock [

	steps add: [ :astToRewrite :astRewritten | 
		[ :astFocused | 
		[ :o | 
		self
			rewriting: astToRewrite
			rewritten: astRewritten
			focusAST: astFocused
			focusVar: o asRBNode
			do: doBlock ] ]
			asGoalWithUnaryASTof: focusBlock
			contextVariables: contextVariables ]
]

{ #category : 'initialization' }
ACL >> focus: focusBlock premise: hpBlock do: doBlock [

	steps add: [ :astToRewrite :astRewritten | 
		[ :astFocused | 
		[ :o | 
		[ :astPremise | 
		[ :oPremise | 
		| g1 g2 |
		g1 := [ :_ | 
		      | dict |
		      dict := Dictionary new
			              at: oPremise asRBNode put: oPremise asRBNode;
			              yourself.

		      contextVariables values
			      with: freshContextVariables
			      do: [ :v :f | dict at: v put: f ].

		      self
			      rewriting: astToRewrite
			      rewritten: _ asRBNode
			      focusAST: astPremise
			      focusVar: oPremise asRBNode
			      do: [ :oo :rr | oo unifyo value: rr ] ] asGoal.
		g2 := self
			      rewriting: astToRewrite
			      rewritten: astRewritten
			      focusAST: astFocused
			      focusVar: o asRBNode
			      do: [ :oo :rr | 
			      doBlock value: oo value: oPremise asRBNode value: rr ].
		g1 , g2 ] ]
			asGoalWithUnaryASTof: hpBlock
			contextVariables: contextVariables ] ]
			asGoalWithUnaryASTof: focusBlock
			contextVariables: contextVariables ]
]

{ #category : 'initialization' }
ACL >> initialize [

	super initialize.

	steps := OrderedCollection new.
	lastBlock := [ :o | true asGoal ]
]

{ #category : 'initialization' }
ACL >> node: aRBNode [

	node := aRBNode
]

{ #category : 'initialization' }
ACL >> rewriting: astToRewrite rewritten: astRewritten focusAST: astFocused focusVar: o do: doBlock [

	^ [ :r | 
	  | g1 g2 g3 astSubstituted rNode dict |
	  rNode := r asRBNode.
	  dict := Dictionary new
		          at: o put: rNode;
		          yourself.

	  contextVariables do: [ :each | dict at: each put: each ].
	  freshContextVariables do: [ :each | dict at: each put: each ].
	  astSubstituted := astFocused substituteVariablesUsingDictionary:
		                    dict.

	  g1 := astToRewrite unifyo value: astFocused.
	  g2 := doBlock value: o value: rNode.
	  g3 := astSubstituted unifyo value: astRewritten.

	  g1 , g2 , g3 ] asGoal
]

{ #category : 'accessing' }
ACL >> then: aBlock [

	lastBlock := aBlock
]

{ #category : 'initialization' }
ACL >> valueWithArguments: variables [

	^ [ :astInitial | 
	  variables halvesAtIncluding: steps size in: [ :vars :doubles | 
		  | pairs goals rbVariables |
		  freshContextVariables := doubles collect: #asRBNode.
		  rbVariables := { astInitial } , vars collect: #asRBNode.
		  pairs := rbVariables overlappingPairsCollect: #->.
		  goals := pairs
			           with: steps
			           collect: [ :pair :aBlock | 
			           aBlock value: pair key value: pair value ].
		  goals := { (rbVariables first unifyo value: node) } , goals.

		  (goals foldr: #, init: true asGoal)
		  , (lastBlock value: rbVariables) ] ] asGoal
]
