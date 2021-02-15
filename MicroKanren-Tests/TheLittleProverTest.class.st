"
A RBProgramNodeIdentityVisitorTest is a test class for testing the behavior of RBProgramNodeIdentityVisitor
"
Class {
	#name : #TheLittleProverTest,
	#superclass : #GoalAbstractTest,
	#instVars : [
		'theory'
	],
	#category : #'MicroKanren-Tests'
}

{ #category : #'code as data' }
TheLittleProverTest >> consª: a isAtomª: b [

	(a cons: b) isAtom
]

{ #category : #predicates }
TheLittleProverTest >> consº: ast isAtomº: rewritten [

	^ [ :a :b | theory isAtomConsº value: ast value: rewritten ]
]

{ #category : #tests }
TheLittleProverTest >> context_chapter_01_frame_19ª: a valueª: b [

	^ #flapjack = (a cons: b) isAtom
]

{ #category : #helpers }
TheLittleProverTest >> expectedRBNode_chapter_01_frame_55 [

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

{ #category : #helpers }
TheLittleProverTest >> expectedRBNode_chapter_01_frame_56 [

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
								     arguments: { (RBMessageNode
										      receiver: (RBLiteralValueNode value: #oats)
										      selector: #cons:
										      arguments: { (RBLiteralValueNode value: nil) }) })
						    selector: #car)
				   selector: #=
				   arguments: { (RBMessageNode
						    receiver:
						    (RBMessageNode
							     receiver: 1 asReifiedVar asRBNode
							     selector: #isAtom)
						    selector: #=
						    arguments: { (RBMessageNode
								     receiver: (RBMessageNode
										      receiver:
										      (RBMessageNode
											       receiver: 2 asReifiedVar asRBNode
											       selector: #isAtom)
										      selector: #cons:
										      arguments: { (RBMessageNode
												       receiver: 3 asReifiedVar asRBNode
												       selector: #=
												       arguments: { (RBMessageNode
														        receiver: 4 asReifiedVar asRBNode
														        selector: #cons:
														        arguments: { 2 asReifiedVar asRBNode }) }) })
								     selector: #isAtom) }) }) }
]

{ #category : #tests }
TheLittleProverTest >> expectedRBNode_chapter_02_frame_12 [

	^ RBMessageNode
		  receiver: (RBMessageNode
				   receiver: (RBMessageNode
						    receiver: 0 asReifiedVar asRBNode
						    selector: #=
						    arguments: { (RBLiteralValueNode value: true) })
				   selector: #ifTrue:ifFalse:
				   arguments: { 
						   (RBBlockNode body:
							    (RBSequenceNode statements:
								     { (RBLiteralValueNode value: true) })).
						   (RBBlockNode body:
							    (RBSequenceNode statements: { (RBMessageNode
									      receiver: (RBLiteralValueNode value: #or)
									      selector: #=
									      arguments: { (RBMessageNode
											       receiver: (RBLiteralValueNode value: #black)
											       selector: #cons:
											       arguments: { (RBMessageNode
													        receiver: (RBLiteralValueNode value: #coffee)
													        selector: #cons:
													        arguments: { (RBLiteralValueNode value: nil) }) }) }) })) })
		  selector: #ifTrue:ifFalse:
		  arguments: { 
				  (RBBlockNode body:
					   (RBSequenceNode statements: { 1 asReifiedVar asRBNode })).
				  (RBBlockNode body:
					   (RBSequenceNode statements: { 1 asReifiedVar asRBNode })) }
]

{ #category : #tests }
TheLittleProverTest >> expectedRBNode_chapter_02_frame_7 [

	^ RBMessageNode
		  receiver: 0 asReifiedVar asRBNode
		  selector: #ifTrue:ifFalse:
		  arguments: { 
				  (RBBlockNode body: (RBSequenceNode statements: { (RBMessageNode
							     receiver: (RBMessageNode
									      receiver: (RBMessageNode
											       receiver: (RBLiteralValueNode value: 3)
											       selector: #cons:
											       arguments: { (RBLiteralValueNode value: nil) })
									      selector: #isAtom)
							     selector: #ifTrue:ifFalse:
							     arguments: { 
									     (RBBlockNode body:
										      (RBSequenceNode statements:
											       { 1 asReifiedVar asRBNode })).
									     (RBBlockNode body:
										      (RBSequenceNode statements:
											       { 2 asReifiedVar asRBNode })) }) })).
				  (RBBlockNode body: (RBSequenceNode statements: { (RBMessageNode
							     receiver: (RBMessageNode
									      receiver: (RBMessageNode
											       receiver: (RBLiteralValueNode value: 3)
											       selector: #cons:
											       arguments: { (RBLiteralValueNode value: nil) })
									      selector: #isAtom)
							     selector: #ifTrue:ifFalse:
							     arguments: { 
									     (RBBlockNode body:
										      (RBSequenceNode statements:
											       { 1 asReifiedVar asRBNode })).
									     (RBBlockNode body:
										      (RBSequenceNode statements:
											       { 2 asReifiedVar asRBNode })) }) })) }
]

{ #category : #predicates }
TheLittleProverTest >> flapjackNilFalseº [

	^ [ :_ | #flapjack = false ] <~> [ :_ | false ]
]

{ #category : #utilities }
TheLittleProverTest >> imagesPath [

	^ self iceWorkingDirectory / 'booklet' / 'source' / '_images'
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
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_16 [

	| aGoal |
	aGoal := [ :rewrite | 
	         [ :ast | 
	         [ :a :b | 
	         theory isAtomConsº value: ast value: rewrite asRBNode ] ]
		         asGoalWithUnaryASTof: [ :a :b | (a cons: b) isAtom ]
		         contextVariables: Dictionary empty ] asGoal.
	self
		assert: aGoal solutions asArray
		equals: { false asLiteralRBNode }.

	^ self exportComputationTreeOfGoal: aGoal limitedTo: -1
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_16_backward [

	| aGoal node |
	aGoal := [ :ast | 
	         [ :a | 
	         theory isAtomConsº value: ast value: false asLiteralRBNode ] ]
		         asGoalWithUnaryASTof: [ :a | a isAtom ]
		         contextVariables: Dictionary empty.

	node := [ :a :b | a cons: b ] 
		        substituteVariablesUsingSequenceableCollection: { 
				        0 asReifiedVar asRBNode.
				        1 asReifiedVar asRBNode }.

	self
		assert: aGoal copy solutions asArray equals: { node };
		assert: node formattedCode equals: '•₀ cons: •₁'.

	^ self exportComputationTreeOfGoal: aGoal copy limitedTo: -1
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_16_byCompiledMethod [

	| aGoal |
	aGoal := [ :rewrite | 
	         [ :ast | self consº: ast isAtomº: rewrite asRBNode ]
		         asGoalWithUnaryASTof: self class >> #consª:isAtomª:
		         contextVariables: #(  ) ] asGoal.
	self
		assert: aGoal solutions asArray
		equals: { false asLiteralRBNode }
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_19 [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :b | 
	         ast
		         acl: [ :prover | 
			         prover
				         focus: [ :o | #flapjack = o ]
				         do: theory isAtomConsº ]
		         then: [ :ast1 :ast2 | 
		         theory unifyº value: ast2 value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ :a :b | 
		         #flapjack = (a cons: b) isAtom ]
		         contextVariables: Dictionary empty ] asGoal.
	self
		assert: aGoal copy solutions asArray
		equals: { [ #flapjack = false ] unaryRBNode }.

	^ self exportComputationTreeOfGoal: aGoal copy limitedTo: -1
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_21 [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :b | 
	         ast
		         acl: [ :prover | 
			         prover
				         focus: [ :o | #flapjack = o ] do: theory isAtomConsº;
				         focus: [ :o | o ] do: self flapjackNilFalseº ]
		         then: [ :ast1 :ast2 :ast3 | 
			         theory unifyº value: ast3 value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ :a :b | 
		         #flapjack = (a cons: b) isAtom ]
		         contextVariables: Dictionary empty ] asGoal.
	self
		assert: aGoal solutions asArray
		equals: { false asLiteralRBNode }
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_28 [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :b | 
	         ast
		         acl: [ :prover | 
			         prover
				         focus: [ :o | (o cons: nil) cdr isAtom ]
				         do: theory carConsº;
				         focus: [ :o | o isAtom ] do: theory cdrConsº;
				         focus: [ :o | o ] do: theory isAtomNilº ]
		         then: [ :ast1 :ast2 :ast3 :ast4 | 
			         theory unifyº value: ast4 value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ :p :q | 
		         ((p cons: q) car cons: nil) cdr isAtom ]
		         contextVariables: Dictionary empty ] asGoal.

	self assert: aGoal solutions asArray equals: { true asLiteralRBNode }
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_32 [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :b | 
	         ast
		         acl: [ :prover | 
			         prover
				         focus: [ :o | o isAtom ] do: theory cdrConsº;
				         focus: [ :o | o ] do: theory isAtomNilº ]
		         then: [ :ast1 :ast2 :ast3 | 
			         theory unifyº value: ast3 value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ :p :q | 
		         ((p cons: q) car cons: nil) cdr isAtom ]
		         contextVariables: Dictionary empty ] asGoal.

	self assert: aGoal solutions asArray equals: { true asLiteralRBNode }
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_44 [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :b | 
	         ast
		         acl: [ :rewrite | 
			         rewrite
				         focus: [ :o | 
				         (o cons: (#and cons: (#crumpets cons: nil))) car ]
				         do: theory equalSameº ]
		         then: [ :ast1 :ast2 | 
		         theory unifyº value: ast2 value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ :x :y | 
			         ((x cons: y) = (x cons: y) cons:
				          (#and cons: (#crumpets cons: nil))) car ]
		         contextVariables: Dictionary empty ] asGoal.

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
	         ast
		         acl: [ :rewrite | 
			         rewrite
				         focus: [ :o | 
				         (o cons: (#and cons: (#crumpets cons: nil))) car ]
				         do: theory equalSameº.
			         rewrite focus: [ :o | o ] do: theory carConsº ]
		         then: [ :ast1 :ast2 :ast3 | 
			         theory unifyº value: ast3 value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ :x :y | 
			         ((x cons: y) = (x cons: y) cons:
				          (#and cons: (#crumpets cons: nil))) car ]
		         contextVariables: Dictionary empty ] asGoal.

	self assert: aGoal solutions asArray equals: { true asLiteralRBNode }
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
	         g1 , g2 ] asGoal ] ]
		         asGoalWithUnaryASTof: [ :a :d | 
		         (#and cons: d) = (a cons: nil) ]
		         contextVariables: Dictionary empty ] asGoal.

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
		         asGoalWithUnaryASTof: [ :a :b | a + b ]
		         contextVariables: Dictionary empty ] asGoal.
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
	         ast
		         acl: [ :rewrite | 
		         rewrite focus: [ :o | o ] do: theory equalSwapº ]
		         then: [ :ast1 :ast2 | 
		         theory unifyº value: ast2 value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ :x :y | 
		         (x cons: y) = (#bagels cons: (#and cons: (#lox cons: nil))) ]
		         contextVariables: Dictionary empty ] asGoal.

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
		assert: node formattedCode
		equals:
			'(#bagels cons: (#and cons: (#lox cons: nil))) = (•₀ cons: •₁)'
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_55 [

	| aGoal node |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :b | 
	         ast
		         acl: [ :rewrite | 
			         rewrite
				         focus: [ :o | b cons: o = (a isAtom = false) ]
				         do: [ :o :r | theory carConsº value: r value: o ] ]
		         then: [ :ast1 :ast2 | 
		         theory unifyº value: ast2 value: rewritten asRBNode ]
		         contextVariables: (Dictionary new
				          at: #a put: a;
				          at: #b put: b;
				          yourself) ] ]
		         asGoalWithUnaryASTof: [ :x :y | 
		         y cons: (x cdr cons: y car) car = (x isAtom = false) ]
		         contextVariables: Dictionary empty ] asGoal.

	node := self expectedRBNode_chapter_01_frame_55.

	self
		assert: aGoal solutions asArray equals: { node };
		assert: node formattedCode equals: '•₀ cons:
	((•₁ cdr cons: •₀ car) car cons: •₂) car = (•₁ isAtom = false)'
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_56 [

	| aGoal node |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :x :y :a :b :c | 
	         ast
		         acl: [ :rewrite | 
			         rewrite
				         focus: [ :o | y cons: o = (x isAtom = false) ]
				         do: [ :o :r | theory carConsº value: r value: o ].

			         rewrite
				         focus: [ :o | 
					         y cons:
						         ((x cdr cons: y car) car cons: (#oats cons: nil)) car
						         = (x isAtom = o) ]
				         do: [ :o :r | theory isAtomConsº value: r value: o ].

			         rewrite
				         focus: [ :o | 
					         y cons:
						         ((x cdr cons: y car) car cons: (#oats cons: nil)) car
						         = (x isAtom = (o isAtom cons: (a cons: b) = c) isAtom) ]
				         do: [ :o :r | theory cdrConsº value: o value: r ].

			         rewrite
				         focus: [ :o | 
					         y cons:
						         ((x cdr cons: y car) car cons: (#oats cons: nil)) car
						         = (x isAtom = (b isAtom cons: o) isAtom) ]
				         do: [ :o :r | theory equalSwapº value: o value: r ] ]
		         then: [ :ast1 :ast2 :ast3 :ast4 :ast5 | 
			         theory unifyº value: ast5 value: rewritten asRBNode ]
		         contextVariables: (Dictionary new
				          at: #x put: x;
				          at: #y put: y;
				          at: #a put: a;
				          at: #b put: b;
				          at: #c put: c;
				          yourself) ] ]
		         asGoalWithUnaryASTof: [ :x :y :a :b :c | 
			         y cons: (x cdr cons: y car) car = (x isAtom = false) ]
		         contextVariables: Dictionary empty ] asGoal.

	node := self expectedRBNode_chapter_01_frame_56.

	self
		assert: aGoal solutions asArray equals: { node };
		assert: node formattedCode
		equals:
			'•₀ cons: ((•₁ cdr cons: •₀ car) car cons: (#oats cons: nil)) car
	= (•₁ isAtom = (•₂ isAtom cons: •₃ = (•₄ cons: •₂)) isAtom)'
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_02_EvenOlderGames_frame_05 [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :c | 
	         ast
		         acl: [ :prover | 
		         prover focus: [ :o | o ] do: theory ifSameº ]
		         then: [ :ast1 :ast2 | 
		         theory unifyº value: ast2 value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ :a :c | 
			         a
				         ifTrue: [ 3 ]
				         ifFalse: [ c ] ]
		         contextVariables: Dictionary empty ] asGoal.

	self assert: aGoal solutions asArray equals: { 3 asLiteralRBNode }
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_02_EvenOlderGames_frame_05_rewriting_unbound [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :c | 
	         ast
		         acl: [ :prover | 
		         prover focus: [ :o | o ] do: theory ifSameº ]
		         then: [ :ast1 :ast2 | 
		         theory unifyº value: ast2 value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ :a :c | 
			         a
				         ifTrue: [ c ]
				         ifFalse: [ c ] ]
		         contextVariables: Dictionary empty ] asGoal.

	self assert: aGoal solutions asArray equals: { 3 asLiteralRBNode }
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_02_EvenOlderGames_frame_07 [

	| aGoal node |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :c | 
	         ast
		         acl: [ :prover | 
			         prover
				         focus: [ :o | o ]
				         do: [ :o :r | theory ifSameº value: r value: o ] ]
		         then: [ :ast1 :ast2 | 
		         theory unifyº value: ast2 value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ :a :c | 
			         (3 cons: nil) isAtom
				         ifTrue: [ a ]
				         ifFalse: [ c ] ]
		         contextVariables: Dictionary empty ] asGoal.

	node := self expectedRBNode_chapter_02_frame_7.
	self
		assert: aGoal solutions asArray equals: { node };
		assert: node formattedCode equals: '•₀
	ifTrue: [ 
		(3 cons: nil) isAtom
			ifTrue: [ •₁ ]
			ifFalse: [ •₂ ] ]
	ifFalse: [ 
		(3 cons: nil) isAtom
			ifTrue: [ •₁ ]
			ifFalse: [ •₂ ] ]'
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_02_EvenOlderGames_frame_15 [

	| aGoal node |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :b :c | 
	         ast
		         acl: [ :prover | 
			         prover
				         focus: [ :o | 
					         (a = true
						          ifTrue: [ 
							          o
								          ifTrue: [ a ]
								          ifFalse: [ b ] ]
						          ifFalse: [ #or = (#black cons: (#coffee cons: nil)) ])
						         ifTrue: [ c ]
						         ifFalse: [ c ] ]
				         do: theory equalSameº.

			         prover
				         focus: [ :o | 
					         (a = true
						          ifTrue: [ o ]
						          ifFalse: [ #or = (#black cons: (#coffee cons: nil)) ])
						         ifTrue: [ c ]
						         ifFalse: [ c ] ]
				         do: theory ifTrueº.

			         prover
				         focus: [ :o | 
					         (a = true
						          ifTrue: [ o ]
						          ifFalse: [ #or = (#black cons: (#coffee cons: nil)) ])
						         ifTrue: [ c ]
						         ifFalse: [ c ] ]
				         do: theory equalIfº ]
		         then: [ :ast1 :ast2 :ast3 :ast4 | 
			         theory unifyº value: ast4 value: rewritten asRBNode ]
		         contextVariables: (Dictionary new
				          at: #a put: a;
				          at: #b put: b;
				          at: #c put: c;
				          yourself) ] ]
		         asGoalWithUnaryASTof: [ :a :b :c | 
			         (a = true
				          ifTrue: [ 
					          nil = nil
						          ifTrue: [ a ]
						          ifFalse: [ b ] ]
				          ifFalse: [ #or = (#black cons: (#coffee cons: nil)) ])
				         ifTrue: [ c ]
				         ifFalse: [ c ] ]
		         contextVariables: Dictionary empty ] asGoal.

	node := self expectedRBNode_chapter_02_frame_12.

	self
		assert: aGoal solutions asArray equals: { node };
		assert: node formattedCode equals: '(•₀ = true
	 ifTrue: [ true ]
	 ifFalse: [ #or = (#black cons: (#coffee cons: nil)) ])
	ifTrue: [ •₁ ]
	ifFalse: [ •₁ ]'
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_02_EvenOlderGames_frame_15_ancestorº [

	| aGoal |
	aGoal := [ :rewritten | 
	         theory ancestorº
		         value: false asLiteralRBNode
		         value: rewritten asRBNode ] asGoal.

	self
		assert:
			((aGoal solutions collect: [ :e | e asRBNode formattedCode ]) 
				 next: 25) asArray
		equals: #( 'false' 'false = •₀' 'false' 'false
	ifTrue: [ •₀ ]
	ifFalse: [ •₁ ]' 'false = •₀' 'false = •₀' '•₀ = false' 'false
	ifTrue: [ •₀ ]
	ifFalse: [ •₁ ]' 'false = •₀ = •₁' 'false' '•₀
	ifTrue: [ •₁ ]
	ifFalse: [ false ]' '•₀ = false' '(false
	 ifTrue: [ •₀ ]
	 ifFalse: [ •₁ ]) = •₂' 'false = •₀' 'false
	ifTrue: [ •₀ ]
	ifFalse: [ •₁ ]' '•₀
	ifTrue: [ false ]
	ifFalse: [ •₁ ]' '•₀
	ifTrue: [ •₁ ]
	ifFalse: [ false ]' '•₀ = false = •₁' 'false
	ifTrue: [ •₀ ]
	ifFalse: [ •₁ ]' 'false = •₀
	ifTrue: [ •₁ ]
	ifFalse: [ •₂ ]' 'false = •₀' '•₀
	ifTrue: [ false ]
	ifFalse: [ •₁ ]' '(•₀
	 ifTrue: [ •₁ ]
	 ifFalse: [ false ]) = •₂' '•₀ = false' '(false
	 ifTrue: [ •₀ ]
	 ifFalse: [ •₁ ])
	ifTrue: [ •₂ ]
	ifFalse: [ •₃ ]' )
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_02_EvenOlderGames_frame_15_ancestorºbackward [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :a :b :c | 
	         theory ancestorº
		         value: rewritten asRBNode
		         value: ([ :z :x :v | 
			          2 + z
				          ifTrue: [ x  ]
				          ifFalse: [ 3 - v ] ] 
				          substituteVariablesUsingSequenceableCollection: { 
						          a asRBNode.
						          b asRBNode.
						          c asRBNode }) ] asGoal ] asGoal.

	self
		assert:
			((aGoal solutions collect: [ :e | e asRBNode formattedCode ]) 
				 next: 5) asArray
		equals: #(  )
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_02_EvenOlderGames_frame_15_equalIfº [

	| aGoal |
	aGoal := [ :rewritten | 
	         theory equalIfº
		         value: rewritten asRBNode
		         value: false asLiteralRBNode ] asGoal.

	self
		assert:
			((aGoal solutions collect: [ :e | e asRBNode formattedCode ]) 
				 next: 2) asArray
		equals: #( 'false' 'false = •₀' 'false' 'false
	ifTrue: [ •₀ ]
	ifFalse: [ •₁ ]' 'false = •₀' 'false = •₀' '•₀ = false' 'false
	ifTrue: [ •₀ ]
	ifFalse: [ •₁ ]' 'false = •₀ = •₁' 'false' '•₀
	ifTrue: [ •₁ ]
	ifFalse: [ false ]' '•₀ = false' '(false
	 ifTrue: [ •₀ ]
	 ifFalse: [ •₁ ]) = •₂' 'false = •₀' 'false
	ifTrue: [ •₀ ]
	ifFalse: [ •₁ ]' '•₀
	ifTrue: [ false ]
	ifFalse: [ •₁ ]' '•₀
	ifTrue: [ •₁ ]
	ifFalse: [ false ]' '•₀ = false = •₁' 'false
	ifTrue: [ •₀ ]
	ifFalse: [ •₁ ]' 'false = •₀
	ifTrue: [ •₁ ]
	ifFalse: [ •₂ ]' 'false = •₀' '•₀
	ifTrue: [ false ]
	ifFalse: [ •₁ ]' '(•₀
	 ifTrue: [ •₁ ]
	 ifFalse: [ false ]) = •₂' '•₀ = false' '(false
	 ifTrue: [ •₀ ]
	 ifFalse: [ •₁ ])
	ifTrue: [ •₂ ]
	ifFalse: [ •₃ ]' )
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_02_EvenOlderGames_frame_15_parentº [

	| aGoal |
	aGoal := [ :rewritten | 
	         theory parentº
		         value: false asLiteralRBNode
		         value: rewritten asRBNode ] asGoal.

	self
		assert: (aGoal solutions collect: [ :e | e formattedCode ]) asArray
		equals: { 'false'. '[ false ]'. 'false = •₀'. 'false
	ifTrue: [ •₀ ]
	ifFalse: [ •₁ ]'. '•₀ = false'. '•₀
	ifTrue: [ •₁ ]
	ifFalse: [ false ]'. '•₀
	ifTrue: [ false ]
	ifFalse: [ •₁ ]' }
]
