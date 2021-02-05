"
A RBProgramNodeIdentityVisitorTest is a test class for testing the behavior of RBProgramNodeIdentityVisitor
"
Class {
	#name : #TheLittleProverTest,
	#superclass : #Srfi41AbstractTest,
	#instVars : [
		'theory'
	],
	#category : #'MicroKanren-Tests'
}

{ #category : #tests }
TheLittleProverTest >> cons: x carcdr: y [

	^ [ :a :b | 
	  ([ 
	   x isAtom
		   ifTrue: [ y ]
		   ifFalse: [ x car cons: x cdr ] ] unifyo value: a) , ([ 
	   x isAtom
		   ifTrue: [ y ]
		   ifFalse: [ x ] ] unifyo value: b) ]
]

{ #category : #tests }
TheLittleProverTest >> consCarCdro [

	^ [ :a :b | 
	  ([ :x :y | 
	   x isAtom
		   ifTrue: [ y ]
		   ifFalse: [ x car cons: x cdr ] ] unifyo value: a) , ([ :w :z | 
	   w isAtom
		   ifTrue: [ z ]
		   ifFalse: [ w ] ] unifyo value: b) ]
]

{ #category : #'code as data' }
TheLittleProverTest >> consª: a isAtomª: b [

	(a cons: b) isAtom
]

{ #category : #predicates }
TheLittleProverTest >> consº: ast isAtomº: rewritten [

	^ [ :a :b | theory isAtomConsº value: ast value: rewritten ]
]

{ #category : #tests }
TheLittleProverTest >> equal: x if: y else: z [

	^ [ :a :b | 
	  ([ 
	   x = y
		   ifTrue: [ x ]
		   ifFalse: [ z ] ] unifyo value: a) , ([ 
	   x = y
		   ifTrue: [ y ]
		   ifFalse: [ z ] ] unifyo value: b) ]
]

{ #category : #tests }
TheLittleProverTest >> equal: x swap: y [

	^ [ :a :b | 
	  ([ x = y ] unifyo value: a) , ([ y = x ] unifyo value: b) ]
]

{ #category : #tests }
TheLittleProverTest >> equalSameo [

	^ [ :a :b | 
	  ([ :x | x = x ] unifyo value: a) , ([ true ] unifyo value: b) ]
]

{ #category : #helpers }
TheLittleProverTest >> expectedRBNode_frame_55 [

	^ RBMessageNode
		  receiver: 0 asReifiedVar asRBNode
		  selector: #cons:
		  arguments: { (RBMessageNode
				   receiver: (RBMessageNode
						    receiver: (RBMessageNode
								     receiver: (RBMessageNode
										      receiver: (RBMessageNode
												       receiver:
												       (RBMessageNode
													        receiver: 1 asReifiedVar asRBNode
													        selector: #cdr)
												       selector: #cons:
												       arguments:
												       { (RBMessageNode
													        receiver: 0 asReifiedVar asRBNode
													        selector: #car) })
										      selector: #car)
								     selector: #cons:
								     arguments: { 2 asReifiedVar asRBNode })
						    selector: #car)
				   selector: #=
				   arguments: { (RBMessageNode
						    receiver:
						    (RBMessageNode
							     receiver: 1 asReifiedVar asRBNode
							     selector: #isAtom)
						    selector: #=
						    arguments: { (RBLiteralValueNode value: false) }) }) }
]

{ #category : #tests }
TheLittleProverTest >> flapjackEqualsConsª: a isAtomª: b [

	#flapjack = (a cons: b) isAtom
]

{ #category : #tests }
TheLittleProverTest >> flapjackEqualsConsº: ast isAtomº: rewritten [

	^ [ :a :b | 
	  ast acl: [ :prover | 
		  prover
			  focus: [ :o | #flapjack = o ] do: theory isAtomConsº;
			  then: [ :o | o unifyo value: rewritten ] ] ]
]

{ #category : #tests }
TheLittleProverTest >> flapjackFalseo [

	^ [ :a :b | 
	  ([ #flapjack = false ] unifyo value: a)
	  , ([ false ] unifyo value: b) ]
]

{ #category : #predicates }
TheLittleProverTest >> flapjackNilFalseº [

	^ [ :a :b | 
	  [ :ast1 | 
	  [ 
	  | g1 g2 |
	  g1 := a unifyo value: ast1.
	  g2 := [ :ast2 | [ b unifyo value: ast2 ] ] asGoalWithUnaryASTof: [ 
		        false ].
	  g1 , g2 ] ] asGoalWithUnaryASTof: [ #flapjack = false ] ]
]

{ #category : #tests }
TheLittleProverTest >> if: x false: y [

	^ [ :a :b | 
	  ([ 
	   false
		   ifTrue: [ x ]
		   ifFalse: [ y ] ] unifyo value: a) , ([ y ] unifyo value: b) ]
]

{ #category : #tests }
TheLittleProverTest >> if: x nest: y answer: z else: w [

	^ [ :a :b | 
	  ([ 
	   x
		   ifTrue: [ 
			   x
				   ifTrue: [ y ]
				   ifFalse: [ z ] ]
		   ifFalse: [ w ] ] unifyo value: a) , ([ 
	   x
		   ifTrue: [ y ]
		   ifFalse: [ w ] ] unifyo value: b) ]
]

{ #category : #tests }
TheLittleProverTest >> if: x nest: y otherwise: z else: w [

	^ [ :a :b | 
	  ([ 
	   x
		   ifTrue: [ w ]
		   ifFalse: [ 
			   x
				   ifTrue: [ y ]
				   ifFalse: [ z ] ] ] unifyo value: a) , ([ 
	   x
		   ifTrue: [ w ]
		   ifFalse: [ z ] ] unifyo value: b) ]
]

{ #category : #tests }
TheLittleProverTest >> if: x same: y [

	^ [ :a :b | 
	  ([ 
	   x
		   ifTrue: [ y ]
		   ifFalse: [ y ] ] unifyo value: a) , ([ y ] unifyo value: b) ]
]

{ #category : #tests }
TheLittleProverTest >> if: x true: y [

	^ [ :a :b | 
	  ([ 
	   true
		   ifTrue: [ x ]
		   ifFalse: [ y ] ] unifyo value: a) , ([ x ] unifyo value: b) ]
]

{ #category : #tests }
TheLittleProverTest >> isAtom: x conso: y [

	^ [ :a :b | 
	  ([ (x cons: y) isAtom ] unifyo value: a)
	  , ([ false ] unifyo value: b) ]
]

{ #category : #tests }
TheLittleProverTest >> isAtomConso [

	^ [ :a :b | 
	  ([ :x :y | (x cons: y) isAtom ] unifyo value: a)
	  , ([ false ] unifyo value: b) ]
]

{ #category : #tests }
TheLittleProverTest >> nilIsNilo [

	^ [ :a :b | 
	  ([ nil isNil ] unifyo value: a) , ([ true ] unifyo value: b) ]
]

{ #category : #tests }
TheLittleProverTest >> proofStep1: a frame21: b ast: ast [

	^ [ :o :ast1 | 
	  [ :r :v | 
	  | g g1 |
	  g := theory isAtomConsº value: o value: r.
	  g1 := (ast1 copy replaceNode: o asRBNode withNode: r asRBNode)
		        unifyo value: v.
	  g , g1 , (self proofStep2: a frame21: b ast: ast) ] asGoal ] 
		  asGoalWithASTof: [ :o | #flapjack = o ]
]

{ #category : #tests }
TheLittleProverTest >> proofStep1: a frame29: b ast: ast [

	^ [ :o :ast1 | 
	  [ :r :v | 
	  | g g1 |
	  g := theory carConsº value: o value: r.
	  g1 := (ast1 copy replaceNode: o asRBNode withNode: r asRBNode)
		        unifyo value: v.
	  g , g1 , (self proofStep2: a frame29: b ast: ast) ] asGoal ] 
		  asGoalWithASTof: [ :o | (o cons: nil) cdr isAtom ]
]

{ #category : #tests }
TheLittleProverTest >> proofStep1: a frame33: b ast: ast [

	^ [ :o :ast1 | 
	  [ :r :v | 
	  | g g1 |
	  g := theory cdrConsº value: o value: r.
	  g1 := (ast1 copy replaceNode: o asRBNode withNode: r asRBNode)
		        unifyo value: v.
	  g , g1 , (self proofStep3: a frame29: b ast: ast) ] asGoal ] 
		  asGoalWithASTof: [ :o | o isAtom ]
]

{ #category : #tests }
TheLittleProverTest >> proofStep1: a frame44: b ast: ast [

	^ [ :o :ast1 | 
	  [ :r :v | 
	  | g g1 |
	  g := theory equalSameº value: o value: r.
	  g1 := (ast1 copy replaceNode: o asRBNode withNode: r asRBNode)
		        unifyo value: v.
	  g , g1 , (self proofStep2: a frame44: b ast: ast) ] asGoal ] 
		  asGoalWithASTof: [ :o | 
		  (o cons: (#and cons: (#crumpets cons: nil))) car ]
]

{ #category : #tests }
TheLittleProverTest >> proofStep2: a frame21: b ast: ast [

	^ [ :o :ast1 | 
	  [ :r :v | 
	  | g g1 |
	  g := self flapjackNilFalseº value: o value: r.
	  g1 := (ast1 copy replaceNode: o asRBNode withNode: r asRBNode)
		        unifyo value: v.
	  g , g1 , (r unifyo value: ast) ] asGoal ] asGoalWithASTof: [ :o | 
		  o ]
]

{ #category : #tests }
TheLittleProverTest >> proofStep2: a frame29: b ast: ast [

	^ [ :o :ast1 | 
	  [ :r :v | 
	  | g g1 |
	  g := theory cdrConsº value: o value: r.
	  g1 := (ast1 copy replaceNode: o asRBNode withNode: r asRBNode)
		        unifyo value: v.
	  g , g1 , (self proofStep3: a frame29: b ast: ast) ] asGoal ] 
		  asGoalWithASTof: [ :o | o isAtom ]
]

{ #category : #tests }
TheLittleProverTest >> proofStep2: a frame44: b ast: ast [

	^ [ :o :ast1 | 
	  [ :r :v | 
	  | g g1 |
	  g := theory carConsº value: o value: v.
	  g1 := (ast1 copy replaceNode: o asRBNode withNode: r asRBNode)
		        unifyo value: v.
	  g , g1 , (r unifyo value: ast) ] asGoal ] asGoalWithASTof: [ :o | 
		  o ]
]

{ #category : #tests }
TheLittleProverTest >> proofStep3: a frame29: b ast: ast [

	^ [ :o :ast1 | 
	  [ :r :v | 
	  | g g1 |
	  g := theory isAtomNilº value: o value: r.
	  g1 := (ast1 copy replaceNode: o asRBNode withNode: r asRBNode)
		        unifyo value: v.
	  g , g1 , (r unifyo value: ast) ] asGoal ] asGoalWithASTof: [ :o | 
		  o ]
]

{ #category : #running }
TheLittleProverTest >> setUp [

	super setUp.

	theory := TheLittleProver new
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_06 [

	"(car (cons 'ham '(eggs)))"

	self assert: (#ham cons: (#eggs cons: nil)) car equals: #ham
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_11 [

	"(atom '())"

	self assert: nil isAtom equals: true
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_14 [

	"(atom (cons 'ham '(eggs)))"

	self assert: (#ham cons: (#eggs cons: nil)) isAtom equals: false
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_16_backward [

	| aGoal node |
	aGoal := [ :ast | 
	         [ :a | 
	         theory isAtomConsº value: ast value: false asLiteralRBNode ] ] 
		         asGoalWithUnaryASTof: [ :a | a isAtom ].

	node := RBMessageNode
		        receiver: 0 asReifiedVar asRBNode
		        selector: #cons:
		        arguments: { 1 asReifiedVar asRBNode }.
	self
		assert: aGoal solutions asArray equals: { node };
		assert: node asString equals: 'RBMessageNode(•₀ cons: •₁)'
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_16_byBlockClosure [

	| aGoal |
	aGoal := [ :rewrite | 
	         [ :ast | 
	         [ :a :b | 
	         theory isAtomConsº value: ast value: rewrite asRBNode ] ] 
		         asGoalWithUnaryASTof: [ :a :b | (a cons: b) isAtom ] ]
		         asGoal.
	self
		assert: aGoal solutions asArray
		equals: { [ false ] unaryRBNode }
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_16_byCompiledMethod [

	| aGoal |
	aGoal := [ :rewrite | 
	         [ :ast | self consº: ast isAtomº: rewrite asRBNode ] 
		         asGoalWithUnaryASTof: self class >> #consª:isAtomª: ]
		         asGoal.
	self
		assert: aGoal solutions asArray
		equals: { [ false ] unaryRBNode }
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_19 [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         self flapjackEqualsConsº: ast isAtomº: rewritten asRBNode ] 
		         asGoalWithUnaryASTof:
		         self class >> #flapjackEqualsConsª:isAtomª: ] asGoal.
	self
		assert: aGoal solutions asArray
		equals: { [ #flapjack = false ] unaryRBNode }
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_21 [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :b | 
	         ast acl: [ :prover | 
		         prover
			         focus: [ :o | #flapjack = o ] do: theory isAtomConsº;
			         focus: [ :o | o ] do: self flapjackNilFalseº;
			         then: [ :o | o unifyo value: rewritten asRBNode ] ] ] ] 
		         asGoalWithUnaryASTof: [ :a :b | 
		         #flapjack = (a cons: b) isAtom ] ] asGoal.
	self
		assert: aGoal solutions asArray
		equals: { [ false ] unaryRBNode }
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_28 [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :b | 
	         ast acl: [ :prover | 
		         prover
			         focus: [ :o | (o cons: nil) cdr isAtom ]
			         do: theory carConsº;
			         focus: [ :o | o isAtom ] do: theory cdrConsº;
			         focus: [ :o | o ] do: theory isAtomNilº;
			         then: [ :o | o unifyo value: rewritten asRBNode ] ] ] ] 
		         asGoalWithUnaryASTof: [ :p :q | 
		         ((p cons: q) car cons: nil) cdr isAtom ] ] asGoal.

	self assert: aGoal solutions asArray equals: { [ true ] unaryRBNode }
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_32 [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :b | 
	         ast acl: [ :prover | 
		         prover
			         focus: [ :o | o isAtom ] do: theory cdrConsº;
			         focus: [ :o | o ] do: theory isAtomNilº;
			         then: [ :o | o unifyo value: rewritten asRBNode ] ] ] ] 
		         asGoalWithUnaryASTof: [ :p :q | 
		         ((p cons: q) car cons: nil) cdr isAtom ] ] asGoal.

	self assert: aGoal solutions asArray equals: { [ true ] unaryRBNode }
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_44 [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :b | 
	         ast acl: [ :rewrite | 
		         rewrite
			         focus: [ :o | 
				         (o cons: (#and cons: (#crumpets cons: nil))) car ]
			         do: theory equalSameº;
			         then: [ :o | o unifyo value: rewritten asRBNode ] ] ] ] 
		         asGoalWithUnaryASTof: [ :x :y | 
			         ((x cons: y) = (x cons: y) cons:
				          (#and cons: (#crumpets cons: nil))) car ] ] asGoal.

	self
		assert: aGoal solutions asArray
		equals:
		{ [ (true cons: (#and cons: (#crumpets cons: nil))) car ]
			unaryRBNode }
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_46 [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :b | 
	         ast acl: [ :rewrite | 
		         rewrite
			         focus: [ :o | 
			         (o cons: (#and cons: (#crumpets cons: nil))) car ]
			         do: theory equalSameº.
		         rewrite
			         focus: [ :o | o ] do: theory carConsº;
			         then: [ :o | o unifyo value: rewritten asRBNode ] ] ] ] 
		         asGoalWithUnaryASTof: [ :x :y | 
			         ((x cons: y) = (x cons: y) cons:
				          (#and cons: (#crumpets cons: nil))) car ] ] asGoal.

	self assert: aGoal solutions asArray equals: { [ true ] unaryRBNode }
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_46_variablesBindingByEqualSameº [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :car :cdr | 
	         [ :r | 
	         | g1 g2 |
	         g1 := theory equalSameº value: ast value: r asRBNode.
	         g2 := rewritten asRBNode unifyo value:
		               (RBMessageNode
			                receiver: car
			                selector: #cons:
			                arguments: { cdr }).
	         g1 , g2 ] asGoal ] ] asGoalWithUnaryASTof: [ :a :d | 
		         (#and cons: d) = (a cons: nil) ] ] asGoal.

	self
		assert: aGoal solutions asArray
		equals: { [ #and cons: nil ] unaryRBNode }
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_46_variablesBindingManually [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :b | 
	         (rewritten asRBNode unifyo value:
		          (RBMessageNode receiver: a selector: #even))
	         , ((RBLiteralValueNode value: 3) unifyo value: a) ] ] 
		         asGoalWithUnaryASTof: [ :a :b | a + b ] ] asGoal.
	self
		assert: aGoal solutions
		equals: { [ 3 even ] unaryRBNode }
		modulo: #asOrderedCollection
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_49 [

	| aGoal node |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :b | 
	         ast acl: [ :rewrite | 
		         rewrite
			         focus: [ :o | o ] do: theory equalSwapº;
			         then: [ :o | o unifyo value: rewritten asRBNode ] ] ] ] 
		         asGoalWithUnaryASTof: [ :x :y | 
		         (x cons: y) = (#bagels cons: (#and cons: (#lox cons: nil))) ] ]
		         asGoal.

	node := RBMessageNode
		        receiver:
		        [ #bagels cons: (#and cons: (#lox cons: nil)) ] unaryRBNode
		        selector: #=
		        arguments: { (RBMessageNode
				         receiver: 0 asReifiedVar asRBNode
				         selector: #cons:
				         arguments: { 1 asReifiedVar asRBNode }) }.

	self
		assert: aGoal solutions asArray equals: { node };
		assert: node asString
		equals:
			'RBMessageNode((#bagels cons: (#and cons: (#lox cons: nil))) = (•₀ cons: •₁))'
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_55 [

	| aGoal node |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :x :y | 
	         ast
		         acl: [ :rewrite | 
			         rewrite
				         focus: [ :o | y cons: o = (x isAtom = false) ]
				         do: [ :o :r | theory carConsº value: r value: o ];
				         then: [ :o | o unifyo value: rewritten asRBNode ] ]
		         contextVariables: (Array with: x with: y) ] ] 
		         asGoalWithUnaryASTof: [ :x :y | 
		         y cons: (x cdr cons: y car) car = (x isAtom = false) ] ]
		         asGoal.

	node := self expectedRBNode_frame_55.

	self
		assert: aGoal solutions asArray equals: { node };
		assert: node asString equals: 'RBMessageNode(•₀ cons:
	((•₁ cdr cons: •₀ car) car cons: •₂) car = (•₁ isAtom = false))'
]
