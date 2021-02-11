"
A Computational Logic.
"
Class {
	#name : #ACL,
	#superclass : #Object,
	#instVars : [
		'steps',
		'node',
		'lastBlock',
		'contextVariables'
	],
	#category : #'MicroKanren-ACL'
}

{ #category : #'as yet unclassified' }
ACL >> argumentNames [

	^ (1 to: steps size) collect: [ :each | 
		  '§' , each asString subscript ]
]

{ #category : #initialization }
ACL >> asGoal [

	^ Fresh new
		  receiver: self;
		  yourself
]

{ #category : #accessing }
ACL >> contextVariables: anObject [

	contextVariables := anObject
]

{ #category : #initialization }
ACL >> focus: focusBlock do: doBlock [

	steps add: [ :astToRewrite :astRewritten | 
		[ :astFocused | 
		[ :o | 
		self
			rewriting: astToRewrite
			rewritten: astRewritten
			focusAST: astFocused
			focusVar: o
			do: doBlock ] ]
			asGoalWithUnaryASTof: focusBlock
			contextVariables: contextVariables ]
]

{ #category : #initialization }
ACL >> initialize [

	super initialize.

	steps := OrderedCollection new.
	lastBlock := [ :o | true asGoal ]
]

{ #category : #initialization }
ACL >> node: aRBNode [

	node := aRBNode
]

{ #category : #initialization }
ACL >> rewriting: astToRewrite rewritten: astRewritten focusAST: astFocused focusVar: o do: doBlock [

	^ [ :r | 
	  | g1 g2 g3 astSubstituted rNode dict |
	  rNode := r asRBNode.
	  dict := Dictionary new
		          at: o put: rNode;
		          yourself.

	  contextVariables do: [ :each | dict at: each put: each ].
	  astSubstituted := astFocused substituteVariablesUsingDictionary:
		                    dict.

	  astFocused allVariables
		  detect: [ :each | each = o ]
		  ifFound: [ :oNode | o parent: oNode parent ]
		  ifNone: [ Error signal: 'Variable substitution failed!' ].
	  astSubstituted allVariables
		  detect: [ :each | each = rNode ]
		  ifFound: [ :anotheRNode | rNode parent: anotheRNode parent ]
		  ifNone: [ Error signal: 'Variable substitution failed!' ].

	  g1 := astToRewrite unifyo value: astFocused.
	  g2 := doBlock value: o value: rNode.
	  g3 := astSubstituted unifyo value: astRewritten.
	  g1 , g2 , g3 ] asGoal
]

{ #category : #accessing }
ACL >> then: aBlock [

	lastBlock := aBlock
]

{ #category : #initialization }
ACL >> valueWithArguments: vars [

	^ [ :astInitial | 
	  | pairs goals rbVariables |
	  rbVariables := { astInitial } , vars collect: #asRBNode.
	  pairs := rbVariables overlappingPairsCollect: #->.
	  goals := pairs
		           with: steps
		           collect: [ :pair :aBlock | 
		           aBlock value: pair key value: pair value ].
	  goals := { (rbVariables first unifyo value: node) } , goals.

	  (goals foldr: #, init: true asGoal)
	  , (lastBlock valueWithArguments: rbVariables) ] asGoal
]
