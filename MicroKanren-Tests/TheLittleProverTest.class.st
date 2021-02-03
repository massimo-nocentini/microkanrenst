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

{ #category : #tests }
TheLittleProverTest >> flapjackFalseo [

	^ [ :a :b | 
	  ([ #flapjack = false ] unifyo value: a)
	  , ([ false ] unifyo value: b) ]
]

{ #category : #tests }
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
	  g := theory atomNilº value: o value: r.
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
TheLittleProverTest >> testFirstExampleOfLittleProver [

	[ :a :b | #flapjack = (a cons: b) isAtom ] acl: [ :theory | 
		theory
			focus: [ :o | #flapjack = o ]
			do: [ :a :b | self isAtom: a conso: b ];
			focus: [ :o | o ] do: #flapjackFalseo;
			yourself ].

	[ :a :b | #flapjack = (a cons: b) isAtom ] acl: [ :theory | 
		theory
			focus: [ :o | #flapjack = o ] do: #isAtomConso;
			focus: [ :o | o ] do: #flapjackFalseo;
			yourself ].

	"’(atom (cdr (cons (car (cons p q)) ’())))"
	[ :p :q | ((p cons: q) car cons: nil) cdr isNil ] acl: [ :theory | 
		theory
			focus: [ :o | (o cons: nil) cdr isNil ] do: #carConso;
			focus: [ :o | o isNil ] do: #cdrConso;
			focus: [ :o | o ] do: #nilIsNilo ].

	[ :p :q | ((p cons: q) car cons: nil) cdr isNil ] acl: [ :theory | 
		theory
			focus: [ :o | o isNil ]
			do: [ 
				self cdrConso value: [ :p :q | (p cons: q) car ] value: [ nil ] ];
			focus: [ :o | o ] do: #nilIsNilo ].

	"’(car (cons (equal (cons x y) (cons x y)) ’(and crumpets)))"
	[ :x :y | 
	((x cons: y) = (x cons: y) cons: (#and cons: (#crumpets cons: nil)))
		car ] acl: [ :theory | 
		theory
			focus: [ :o | (o cons: (#and cons: (#crumpets cons: nil))) car ]
			do: [ self equalSameo value: [ :x :y | x cons: y ] ];
			focus: [ :o | o ] do: [ 
				self carConso
					value: [ true ]
					value: [ #and cons: (#crumpets cons: nil) ] ] ].


	self
		assert:
			([ :x | [ :a :b | #flapjack = (a cons: b) isAtom ] ] sourceNode
				 body acceptVisitor: RBProgramNodeIdentityVisitor new)
		equals: [ :x | 
			[ :a :b | 
			| f |
			#flapjack = (a ~~> x) isAtom ] ] sourceNode body
]

{ #category : #tests }
TheLittleProverTest >> testFirstExampleOfLittleProverWithLogicVars [
	self
		deny:
			[ :x | 
			[ :a :b | 
			| f |
			#flapjack = (a ~~> x) isAtom ] ] context
		equals:
			[ :x | 
			[ :a :b | 
			| f |
			#flapjack = (a ~~> x) isAtom ] ] sourceNode body
]

{ #category : #tests }
TheLittleProverTest >> testFlapjackIsAtomConso [

	self
		assert: [ :aSend | 
			[ :o :ast | ast sendso value: aSend ] asGoalWithASTof: [ :o | o ] ]
				asGoal solutions
		equals: {  }
		modulo: #asOrderedCollection.

	[ :a :b | #flapjack = (a cons: b) isAtom ] acl: [ :theory | 
		theory
			focus: [ :o | #flapjack = o ]
			do: [ :a :b | self isAtom: a conso: b ];
			focus: [ :o | o ] do: #flapjackFalseo;
			yourself ]
]

{ #category : #tests }
TheLittleProverTest >> test_atomConsº [

	| aGoal |
	aGoal := [ :rewrite | 
	         [ :ast | 
	         [ :cdr | 
	         theory isAtomConsº value: ast value: rewrite asRBNode ] ] 
		         asGoalWithUnaryASTof: [ :cdr | (3 cons: cdr) isAtom ] ]
		         asGoal.
	self
		assert: aGoal solutions
		equals: { [ false ] sourceNode body statements first }
		modulo: #asOrderedCollection
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
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_16 [

	| aGoal |
	aGoal := [ :rewrite | 
	         [ :ast | 
	         [ :a :b | 
	         theory isAtomConsº value: ast value: rewrite asRBNode ] ] 
		         asGoalWithUnaryASTof: self class >> #ª:consIsAtom: ] asGoal.
	self
		assert: aGoal solutions
		equals: { [ false ] unaryRBNode }
		modulo: #asOrderedCollection
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_16_byGoal [

	| aGoal |
	aGoal := [ :rewrite | 
	         [ :ast | 
	         [ :a :b | 
	         theory isAtomConsº value: ast value: rewrite asRBNode ] ] 
		         asGoalWithUnaryASTof: self class >> #ª:consIsAtom: ] asGoal.
	self
		assert: aGoal solutions
		equals: { [ false ] unaryRBNode }
		modulo: #asOrderedCollection
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_16_byGoalWithBlock [

	| aGoal |
	aGoal := [ :rewrite | 
	         [ :ast | 
	         [ :a :b | 
	         theory isAtomConsº value: ast value: rewrite asRBNode ] ] 
		         asGoalWithUnaryASTof: [ :a :b | (a cons: b) isAtom ] ]
		         asGoal.
	self
		assert: aGoal solutions
		equals: { [ false ] unaryRBNode }
		modulo: #asOrderedCollection
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_1_OldGamesNewRules_frame_21 [

	"(equal 'flapjack (atom (cons a b)))"

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :b | 
	         [ :ast1 | 
	         [ :o1 | 
	         [ :r1 :o2 :r2 :d | 
	         | fast |
	         fast := ast1 substituteVariablesUsingDictionary:
		                 { (o1 -> r1 asRBNode) } asDictionary.
	         (ast unifyo value: ast1)
	         , (theory isAtomConsº value: o1 value: r1)
	         , (fast unifyo value: o2)
	         , (self flapjackNilFalseº value: o2 value: d)
	         , (d unifyo value: rewritten) ] asGoal ] ] 
		         asGoalWithUnaryASTof: [ :o | #flapjack = o ] ] ] 
		         asGoalWithUnaryASTof: [ :a :b | 
		         #flapjack = (a cons: b) isAtom ] ] asGoal.
	self
		assert: aGoal solutions
		equals: { [ false ] sourceNode body statements first }
		modulo: #asOrderedCollection
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_1_OldGamesNewRules_frame_21_focus [

	"(equal 'flapjack (atom (cons a b)))"

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
		assert: aGoal solutions
		equals: { [ false ] sourceNode body statements first }
		modulo: #asOrderedCollection
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_1_OldGamesNewRules_frame_44 [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :b | 
	         [ :oast | 
	         [ :o | 
	         [ :r :c :d | 
	         | fast |
	         fast := oast substituteVariablesUsingDictionary:
		                 { (o -> r asRBNode) } asDictionary.
	         (ast unifyo value: oast)
	         , (theory equalSameº value: o value: r)
	         , (fast unifyo value: c)
	         , (theory carConsº value: c value: d)
	         , (d unifyo value: rewritten) "to bind `o`" "to bind `c`" ]
		         asGoal ] ] asGoalWithUnaryASTof: [ :o | 
		         (o cons: (#and cons: (#crumpets cons: nil))) car ] ] ] 
		         asGoalWithUnaryASTof: [ :x :y | 
			         ((x cons: y) = (x cons: y) cons:
				          (#and cons: (#crumpets cons: nil))) car ] ] asGoal.
	self
		assert: aGoal solutions
		equals: { [ true ] sourceNode body statements first }
		modulo: #asOrderedCollection
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_1_OldGamesNewRules_frame_44_focus [

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
			         focus: [ :o | o ] do: [ :c :r | 
				         (theory carConsº value: c value: r)
				         , { r logicVar } projectº ];
			         then: [ :o | o unifyo value: rewritten asRBNode ] ] ] ] 
		         asGoalWithUnaryASTof: [ :x :y | 
			         ((x cons: y) = (x cons: y) cons:
				          (#and cons: (#crumpets cons: nil))) car ] ] asGoal.
	self
		assert: aGoal solutions
		equals: { [ true ] sourceNode body statements first }
		modulo: #asOrderedCollection
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_1_OldGamesNewRules_frame_49 [

	"
	the term (equal (cons x y) (cons 'bagels '(and lox)))
	rewrites (equal (cons 'bagels '(and lox)) (cons x y))
	"

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :b | 
	         [ :oast | 
	         [ :o | 
	         [ :r :c :d | 
	         | fast |
	         fast := oast substituteVariablesUsingDictionary:
		                 { (o -> r asRBNode) } asDictionary.
	         (ast unifyo value: oast)
	         , (theory equalSwapº value: o value: r)
	         , (fast unifyo value: c) , (c unifyo value: rewritten) ]
		         asGoal ] ] asGoalWithUnaryASTof: [ :o | o ] ] ] 
		         asGoalWithUnaryASTof: [ :x :y | 
		         (x cons: y) = (#bagels cons: (#and cons: (#lox cons: nil))) ] ]
		         asGoal.
	self
		assert: aGoal solutions
		equals: { [ :x :y | 
			(#bagels cons: (#and cons: (#lox cons: nil))) = (x cons: y) ]
				sourceNode body statements first }
		modulo: #asOrderedCollection
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_1_OldGamesNewRules_frame_49_focus [

	"
	the term (equal (cons x y) (cons 'bagels '(and lox)))
	rewrites (equal (cons 'bagels '(and lox)) (cons x y))
	"

	| aGoal |
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
	self
		assert: aGoal solutions
		equals: { [ :x :y | 
			(#bagels cons: (#and cons: (#lox cons: nil))) = (x cons: y) ]
				sourceNode body statements first }
		modulo: #asOrderedCollection
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_1_OldGamesNewRules_test [

	"(equal 'flapjack (atom (cons a b)))"

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
TheLittleProverTest >> test_equalSameº [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | self ˆandCons: ast equalNilConsed: rewritten ] 
		         asGoalWithUnaryASTof:
		         self class >> #ªandCons:equalNilConsed: ] asGoal.
	self
		assert: aGoal solutions asArray
		equals: { [ #and cons: nil ] unaryRBNode }
]

{ #category : #'code as data' }
TheLittleProverTest >> ª: a consIsAtom: b [

	(a cons: b) isAtom
]

{ #category : #'code as data' }
TheLittleProverTest >> ªandCons: d equalNilConsed: a [

	(#and cons: d) = (a cons: nil)
]

{ #category : #rewriting }
TheLittleProverTest >> ˆandCons: ast equalNilConsed: rewritten [

	^ [ :cdr :car | 
	  [ :r | 
	  | g1 g2 |
	  g1 := theory equalSameº value: ast value: r asRBNode.
	  g2 := rewritten unifyo value:
		        (RBMessageNode
			         receiver: car
			         selector: #cons:
			         arguments: { cdr }).
	  g1 , g2 ] asGoal ]
]
