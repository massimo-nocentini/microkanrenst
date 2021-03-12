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
TheLittleProverTest >> expectedRBNode_chapter_02_frame_15 [

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
		assert: aGoal solutions readStream upToEnd
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
		assert: aGoal solutions readStream upToEnd equals: { node };
		assert: node formattedCode equals: '•₀ cons: •₁'.

	^ self exportComputationTreeOfGoal: aGoal limitedTo: -1
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_16_byCompiledMethod [

	| aGoal |
	aGoal := [ :rewrite | 
	         [ :ast | self consº: ast isAtomº: rewrite asRBNode ]
		         asGoalWithUnaryASTof: self class >> #consª:isAtomª:
		         contextVariables: #(  ) ] asGoal.
	self
		assert: aGoal solutions readStream upToEnd
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
		         then: [ :asts | 
		         theory unifyº value: asts last value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ :a :b | 
		         #flapjack = (a cons: b) isAtom ]
		         contextVariables: Dictionary empty ] asGoal.
	self
		assert: aGoal solutions readStream upToEnd
		equals: { [ #flapjack = false ] unaryRBNode }.

	^ self exportComputationTreeOfGoal: aGoal limitedTo: -1
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
		         then: [ :asts | 
		         theory unifyº value: asts last value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ :a :b | 
		         #flapjack = (a cons: b) isAtom ]
		         contextVariables: Dictionary empty ] asGoal.
	self
		assert: aGoal solutions readStream upToEnd
		equals: { false asLiteralRBNode }.

	^ self exportComputationTreeOfGoal: aGoal limitedTo: -1
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
		         then: [ :asts | 
		         theory unifyº value: asts last value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ :p :q | 
		         ((p cons: q) car cons: nil) cdr isAtom ]
		         contextVariables: Dictionary empty ] asGoal.

	self
		assert: aGoal solutions readStream upToEnd
		equals: { true asLiteralRBNode }.

	^ self exportComputationTreeOfGoal: aGoal limitedTo: -1
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
		         then: [ :asts | 
		         theory unifyº value: asts last value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ :p :q | 
		         ((p cons: q) car cons: nil) cdr isAtom ]
		         contextVariables: Dictionary empty ] asGoal.

	self
		assert: aGoal solutions readStream upToEnd
		equals: { true asLiteralRBNode }.

	^ self exportComputationTreeOfGoal: aGoal limitedTo: -1
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
		         then: [ :asts | 
		         theory unifyº value: asts last value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ :x :y | 
			         ((x cons: y) = (x cons: y) cons:
				          (#and cons: (#crumpets cons: nil))) car ]
		         contextVariables: Dictionary empty ] asGoal.

	self
		assert: aGoal solutions readStream upToEnd
		equals:
		{ [ (true cons: (#and cons: (#crumpets cons: nil))) car ]
			unaryRBNode }.

	^ self exportComputationTreeOfGoal: aGoal limitedTo: -1
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
		         then: [ :asts | 
		         theory unifyº value: asts last value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ :x :y | 
			         ((x cons: y) = (x cons: y) cons:
				          (#and cons: (#crumpets cons: nil))) car ]
		         contextVariables: Dictionary empty ] asGoal.

	self
		assert: aGoal solutions readStream upToEnd
		equals: { true asLiteralRBNode }.

	^ self exportComputationTreeOfGoal: aGoal limitedTo: -1
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_46_variablesBindingByEqualSame [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :car :cdr | 
	         [ :r | 
	         | g1 g2 |
	         g1 := theory equalSameº value: ast value: r asRBNode.
	         g2 := rewritten asRBNode unifyo value: (RBMessageNode
			                receiver: car asRBNode
			                selector: #cons:
			                arguments: { cdr asRBNode }).
	         g1 , g2 ] asGoal ] ]
		         asGoalWithUnaryASTof: [ :a :d | 
		         (#and cons: d) = (a cons: nil) ]
		         contextVariables: Dictionary empty ] asGoal.

	self
		assert: aGoal solutions readStream upToEnd
		equals: { [ #and cons: nil ] unaryRBNode }.

	^ self exportComputationTreeOfGoal: aGoal limitedTo: -1
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_01_OldGamesNewRules_frame_46_variablesBindingManually [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a :b | 
	         (rewritten asRBNode unifyo value:
		          (RBMessageNode receiver: a asRBNode selector: #even))
	         , ((RBLiteralValueNode value: 3) unifyo value: a asRBNode) ] ]
		         asGoalWithUnaryASTof: [ :a :b | a + b ]
		         contextVariables: Dictionary empty ] asGoal.
	self
		assert: aGoal solutions readStream upToEnd
		equals: { [ 3 even ] unaryRBNode }.

	^ self exportComputationTreeOfGoal: aGoal limitedTo: -1
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
		         then: [ :asts | 
		         theory unifyº value: asts last value: rewritten asRBNode ]
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
		assert: aGoal solutions readStream upToEnd equals: { node };
		assert: node formattedCode
		equals:
			'(#bagels cons: (#and cons: (#lox cons: nil))) = (•₀ cons: •₁)'.

	^ self exportComputationTreeOfGoal: aGoal limitedTo: -1
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
		         then: [ :asts | 
		         theory unifyº value: asts last value: rewritten asRBNode ]
		         contextVariables: (Dictionary new
				          at: #a put: a asRBNode;
				          at: #b put: b asRBNode;
				          yourself) ] ]
		         asGoalWithUnaryASTof: [ :x :y | 
		         y cons: (x cdr cons: y car) car = (x isAtom = false) ]
		         contextVariables: Dictionary empty ] asGoal.

	node := self expectedRBNode_chapter_01_frame_55.

	self
		assert: aGoal solutions readStream upToEnd equals: { node };
		assert: node formattedCode equals: '•₀ cons:
	((•₁ cdr cons: •₀ car) car cons: •₂) car = (•₁ isAtom = false)'.

	^ self exportComputationTreeOfGoal: aGoal limitedTo: -1
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
		         then: [ :asts | 
		         theory unifyº value: asts last value: rewritten asRBNode ]
		         contextVariables: (Dictionary new
				          at: #x put: x asRBNode;
				          at: #y put: y asRBNode;
				          at: #a put: a asRBNode;
				          at: #b put: b asRBNode;
				          at: #c put: c asRBNode;
				          yourself) ] ]
		         asGoalWithUnaryASTof: [ :x :y :a :b :c | 
			         y cons: (x cdr cons: y car) car = (x isAtom = false) ]
		         contextVariables: Dictionary empty ] asGoal.

	node := self expectedRBNode_chapter_01_frame_56.

	self
		assert: aGoal solutions readStream upToEnd equals: { node };
		assert: node formattedCode
		equals:
			'•₀ cons: ((•₁ cdr cons: •₀ car) car cons: (#oats cons: nil)) car
	= (•₁ isAtom = (•₂ isAtom cons: •₃ = (•₄ cons: •₂)) isAtom)'.

	^ self exportComputationTreeOfGoal: aGoal limitedTo: -1
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
		         then: [ :asts | 
		         theory unifyº value: asts last value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ :a :c | 
			         a
				         ifTrue: [ 3 ]
				         ifFalse: [ c ] ]
		         contextVariables: Dictionary empty ] asGoal.

	self
		assert: aGoal solutions readStream upToEnd
		equals: { 3 asLiteralRBNode }.

	^ self exportComputationTreeOfGoal: aGoal limitedTo: -1
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
		         then: [ :asts | 
		         theory unifyº value: asts last value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ :a :c | 
			         a
				         ifTrue: [ c ]
				         ifFalse: [ c ] ]
		         contextVariables: Dictionary empty ] asGoal.

	self
		assert: aGoal solutions readStream upToEnd
		equals: { 0 asReifiedVar }
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
		         then: [ :asts | 
		         theory unifyº value: asts last value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ :a :c | 
			         (3 cons: nil) isAtom
				         ifTrue: [ a ]
				         ifFalse: [ c ] ]
		         contextVariables: Dictionary empty ] asGoal.

	node := self expectedRBNode_chapter_02_frame_7.
	self
		assert: aGoal solutions readStream upToEnd equals: { node };
		assert: node formattedCode equals: '•₀
	ifTrue: [ 
		(3 cons: nil) isAtom
			ifTrue: [ •₁ ]
			ifFalse: [ •₂ ] ]
	ifFalse: [ 
		(3 cons: nil) isAtom
			ifTrue: [ •₁ ]
			ifFalse: [ •₂ ] ]'.

	^ self exportComputationTreeOfGoal: aGoal limitedTo: -1
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
				         premise: [ :o | 
					         o
						         ifTrue: [ c ]
						         ifFalse: [ c ] ]
				         do: theory equalIf0º ]
		         then: [ :asts | 
		         theory unifyº value: asts last value: rewritten asRBNode ]
		         contextVariables: (Dictionary new
				          at: #a put: a asRBNode;
				          at: #b put: b asRBNode;
				          at: #c put: c asRBNode;
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

	node := self expectedRBNode_chapter_02_frame_15.

	self
		assert: (aGoal solutions next: 1) readStream upToEnd
		equals: { node };
		assert: node formattedCode equals: '(•₀ = true
	 ifTrue: [ true ]
	 ifFalse: [ #or = (#black cons: (#coffee cons: nil)) ])
	ifTrue: [ •₁ ]
	ifFalse: [ •₁ ]'.

	^ self exportComputationTreeOfGoal: aGoal limitedTo: 1
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_02_EvenOlderGames_frame_15_ancestoro [

	| aGoal |
	aGoal := [ :rewritten | 
	         theory ancestorº
		         value: false asLiteralRBNode
		         value: rewritten asRBNode ] asGoal.

	self
		assert:
			((aGoal solutions collect: [ :e | e formattedCode ]) next: 25)
				readStream upToEnd
		equals:
			#( 'false car' 'false cdr' '[ false ]' 'false' 'false car car'
			   'false cdr car' 'false = •₀' '•₀ = false' 'false cons: •₀'
			   '•₀ cons: false' 'false + •₀' '•₀ + false' 'false - •₀'
			   '•₀ - false' 'false
	ifTrue: [ •₀ ]
	ifFalse: [ •₁ ]' '•₀
	ifTrue: [ false ]
	ifFalse: [ •₁ ]' '•₀
	ifTrue: [ •₁ ]
	ifFalse: [ false ]' 'false car cdr' 'false cdr cdr' '[ false ] car'
			   'false car' 'false car car car' 'false cdr car car'
			   '[ false car ]' '[ false cdr ]' ).

	^ self exportComputationTreeOfGoal: aGoal limitedTo: 25
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_02_EvenOlderGames_frame_15_ancestorobackward [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :a :b :c | 
	         theory ancestorº
		         value: rewritten asRBNode
		         value: ([ :z :x :v | 
			          2 + z
				          ifTrue: [ 
					          x
						          ifTrue: [ 3 ]
						          ifFalse: [ 1 ] ]
				          ifFalse: [ 3 - v ] ] 
				          substituteVariablesUsingSequenceableCollection: { 
						          a asRBNode.
						          b asRBNode.
						          c asRBNode }) ] asGoal ] asGoal.

	self
		assert:
			((aGoal solutions collect: [ :e | e formattedCode ]) next: 20)
				readStream upToEnd
		equals: #( '2 + •₀' '•₀
	ifTrue: [ 3 ]
	ifFalse: [ 1 ]' '3 - •₀' '2' '◊•₀' '◊•₀' '◊•₀' '◊•₀' '3' '1' '3' '◊•₀'
			   '◊•₀' '◊•₀' '◊•₀' '◊•₀' '◊•₀' '◊•₀' '◊•₀' '◊•₀' ).

	^ self exportComputationTreeOfGoal: aGoal limitedTo: 20
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_02_EvenOlderGames_frame_15_parento [

	| aGoal |
	aGoal := [ :rewritten | 
	         theory parentº
		         value: false asLiteralRBNode
		         value: rewritten asRBNode ] asGoal.

	self
		assert:
		(aGoal solutions collect: [ :e | e formattedCode ]) readStream
			upToEnd
		equals: #( 'false car' 'false cdr' '[ false ]' 'false' 'false = •₀'
			   '•₀ = false' 'false cons: •₀' '•₀ cons: false' 'false + •₀'
			   '•₀ + false' 'false - •₀' '•₀ - false' 'false
	ifTrue: [ •₀ ]
	ifFalse: [ •₁ ]' '•₀
	ifTrue: [ false ]
	ifFalse: [ •₁ ]' '•₀
	ifTrue: [ •₁ ]
	ifFalse: [ false ]' ).

	^ self exportComputationTreeOfGoal: aGoal limitedTo: -1
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_02_EvenOlderGames_frame_33 [

	| aGoal node |
	self skip.
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ 
	         ast
		         acl: [ :prover | 
			         prover
				         focus: [ :o | 
					         #gyre cons:
						         ((#callooh cons: (#callay cons: nil)) isUffish
							          ifTrue: [ 
								          #gimble cons:
									          ((#callooh cons: (#callay cons: nil)) isBrillig
										           ifTrue: [ #borogove cons: (#outgrabe cons: nil) ]
										           ifFalse: [ #bandersnatch cons: (#wabe cons: nil) ]) ]
							          ifFalse: [ o cons: (#vorpal cons: nil) ]) ]
				         premise: [ :o | #gyre cons: o ]
				         do: theory jabberwockyº ]
		         then: [ :asts | 
		         theory unifyº value: asts last value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ 
			         #gyre cons:
				         ((#callooh cons: (#callay cons: nil)) isUffish
					          ifTrue: [ 
						          #gimble cons:
							          ((#callooh cons: (#callay cons: nil)) isBrillig
								           ifTrue: [ #borogove cons: (#outgrabe cons: nil) ]
								           ifFalse: [ #bandersnatch cons: (#wabe cons: nil) ]) ]
					          ifFalse: [ 
						          (#callooh cons: (#callay cons: nil)) frabjous cons:
							          (#vorpal cons: nil) ]) ]
		         contextVariables: Dictionary empty ] asGoal.

	node := self expectedRBNode_chapter_02_frame_15.

	self
		assert: (aGoal solutions next: 1) readStream upToEnd
		equals: { node };
		assert: node formattedCode equals: '(•₀ = true
	 ifTrue: [ true ]
	 ifFalse: [ #or = (#black cons: (#coffee cons: nil)) ])
	ifTrue: [ •₁ ]
	ifFalse: [ •₁ ]'
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_02_EvenOlderGames_frame_43 [

	| aGoal node |
	self skip.
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ 
	         ast
		         acl: [ :prover | 
			         prover
				         focus: [ :o | 
					         #gyre cons:
						         ((#callooh cons: (#callay cons: nil)) isUffish
							          ifTrue: [ 
								          #gimble cons:
									          ((#callooh cons: (#callay cons: nil)) isBrillig
										           ifTrue: [ #borogove cons: (#outgrabe cons: nil) ]
										           ifFalse: [ o cons: (#wabe cons: nil) ]) ]
							          ifFalse: [ 
								          (#callooh cons: (#callay cons: nil)) frabjous cons:
									          (#vorpal cons: nil) ]) ]
				         premise: [ :o | #gyre cons: o ]
				         do: [ :o :p :r | 
					         theory jabberwockyº value: r value: p value: o
					         " , [ :aState | self halt ] inspectº" ] ]
		         then: [ :asts | 
		         theory unifyº value: asts last value: rewritten asRBNode ]
		         contextVariables: Dictionary empty ] ]
		         asGoalWithUnaryASTof: [ 
			         #gyre cons:
				         ((#callooh cons: (#callay cons: nil)) isUffish
					          ifTrue: [ 
						          #gimble cons:
							          ((#callooh cons: (#callay cons: nil)) isBrillig
								           ifTrue: [ #borogove cons: (#outgrabe cons: nil) ]
								           ifFalse: [ #bandersnatch cons: (#wabe cons: nil) ]) ]
					          ifFalse: [ 
						          (#callooh cons: (#callay cons: nil)) frabjous cons:
							          (#vorpal cons: nil) ]) ]
		         contextVariables: Dictionary empty ] asGoal.

	node := self expectedRBNode_chapter_02_frame_15.

	self
		assert: (aGoal solutions next: 1) readStream upToEnd
		equals: { node };
		assert: node formattedCode equals: '(•₀ = true
	 ifTrue: [ true ]
	 ifFalse: [ #or = (#black cons: (#coffee cons: nil)) ])
	ifTrue: [ •₁ ]
	ifFalse: [ •₁ ]'
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_02_EvenOlderGames_frame_57 [

	| aGoal |
	aGoal := [ :rewritten | 
	         [ :ast | 
	         [ :a | 
	         ast
		         acl: [ :prover | 
			         prover
				         focus: [ :o | 
					         a car isAtom
						         ifTrue: [ 
							         a car = a cdr
								         ifTrue: [ #hominy ]
								         ifFalse: [ #grits ] ]
						         ifFalse: [ 
							         a car cdr = (#hash cons: (#browns cons: nil))
								         ifTrue: [ #ketchup cons: o ]
								         ifFalse: [ #mustard cons: a car ] ] ]
				         premise: [ :o | o ]
				         do: [ :o :p :r | 
				         theory consCarCdrº value: r value: p value: o ].

			         prover
				         focus: [ :o | 
					         a car isAtom
						         ifTrue: [ 
							         a car = a cdr
								         ifTrue: [ #hominy ]
								         ifFalse: [ #grits ] ]
						         ifFalse: [ 
							         a car cdr = (#hash cons: (#browns cons: nil))
								         ifTrue: [ #ketchup cons: (a car car cons: o) ]
								         ifFalse: [ #mustard cons: a car ] ] ]
				         premise: [ :o | 
					         a car isAtom
						         ifTrue: [ 
							         a car = a cdr
								         ifTrue: [ #hominy ]
								         ifFalse: [ #grits ] ]
						         ifFalse: [ o ] ]
				         do: theory equalIfº ]
		         then: [ :asts | 
		         theory unifyº value: asts last value: rewritten asRBNode ]
		         contextVariables: (Dictionary new
				          at: #a put: a asRBNode;
				          yourself) ] ]
		         asGoalWithUnaryASTof: [ :a | 
			         a car isAtom
				         ifTrue: [ 
					         a car = a cdr
						         ifTrue: [ #hominy ]
						         ifFalse: [ #grits ] ]
				         ifFalse: [ 
					         a car cdr = (#hash cons: (#browns cons: nil))
						         ifTrue: [ #ketchup cons: a car ]
						         ifFalse: [ #mustard cons: a car ] ] ]
		         contextVariables: Dictionary empty ] asGoal.

	self
		assert: (aGoal solutions next: 1) readStream upToEnd
		equals: { ([ :a | 
			 a car isAtom
				 ifTrue: [ 
					 a car = a cdr
						 ifTrue: [ #hominy ]
						 ifFalse: [ #grits ] ]
				 ifFalse: [ 
					 a car cdr = (#hash cons: (#browns cons: nil))
						 ifTrue: [ 
						 #ketchup cons:
							 (a car car cons: (#hash cons: (#browns cons: nil))) ]
						 ifFalse: [ #mustard cons: a car ] ] ] 
				 substituteVariablesUsingSequenceableCollection:
				 { 0 asReifiedVar asRBNode }) }
]

{ #category : #tests }
TheLittleProverTest >> test_chapter_02_EvenOlderGames_frame_57_premise [

	| aGoal n a |
	aGoal := [ :v :w | 
	         a := RBMessageNode
		              receiver: (RBLiteralValueNode value: #ketchup)
		              selector: #cons:
		              arguments: { (RBMessageNode
				               receiver: (RBMessageNode
						                receiver:
						                (RBMessageNode
							                 receiver: v asRBNode
							                 selector: #car)
						                selector: #car)
				               selector: #cons:
				               arguments: { (RBMessageNode
						                receiver:
						                (RBMessageNode
							                 receiver: v asRBNode
							                 selector: #car)
						                selector: #cdr) }) }.
	         n := RBMessageNode
		              receiver:
		              (RBMessageNode receiver: w asRBNode selector: #car)
		              selector: #cdr.

	         (theory unifyº value: n value: a)
	         | (theory ancestorº value: n value: a) ] asGoal.

	self
		assert: (aGoal solutions next: 40) readStream upToEnd asString
		equals:
			'an Array(an Array(•₀ •₀) an Array(RBMessageNode(•₀ car cdr) •₀) an Array(RBMessageNode(•₀ car cdr) •₀) an Array(RBMessageNode(•₀ car cdr car) •₀) an Array(RBMessageNode(•₀ car cdr cdr) •₀) an Array(RBMessageNode(•₀ car cdr car) •₀) an Array(RBMessageNode(•₀ car cdr cdr) •₀) an Array(RBBlockNode([ •₀ car cdr ]) •₀) an Array(RBSequenceNode(•₀ car cdr) •₀) an Array(RBBlockNode([ •₀ car cdr ]) •₀) an Array(RBSequenceNode(•₀ car cdr) •₀) an Array(RBMessageNode(•₀ car cdr car car) •₀) an Array(RBMessageNode(•₀ car cdr cdr car) •₀) an Array(RBMessageNode(•₀ car cdr car car) •₀) an Array(RBMessageNode(•₀ car cdr cdr car) •₀) an Array(RBMessageNode(•₀ car cdr = •₁) •₀) an Array(RBMessageNode(•₀ = •₁ car cdr) •₁) an Array(RBMessageNode(•₀ car cdr cons: •₁) •₀) an Array(RBMessageNode(•₀ cons: •₁ car cdr) •₁) an Array(RBMessageNode(•₀ car cdr + •₁) •₀) an Array(RBMessageNode(•₀ + •₁ car cdr) •₁) an Array(RBMessageNode(•₀ car cdr - •₁) •₀) an Array(RBMessageNode(•₀ - •₁ car cdr) •₁) an Array(RBMessageNode(•₀ car cdr
	ifTrue: [ •₁ ]
	ifFalse: [ •₂ ]) •₀) an Array(RBMessageNode(•₀
	ifTrue: [ •₁ car cdr ]
	ifFalse: [ •₂ ]) •₁) an Array(RBMessageNode(•₀
	ifTrue: [ •₁ ]
	ifFalse: [ •₂ car cdr ]) •₂) an Array(RBMessageNode(•₀ car cdr car cdr) •₀) an Array(RBMessageNode(•₀ car cdr cdr cdr) •₀) an Array(RBMessageNode(•₀ car cdr = •₁) •₀) an Array(RBMessageNode(•₀ = •₁ car cdr) •₁) an Array(RBMessageNode(•₀ car cdr cons: •₁) •₀) an Array(RBMessageNode(•₀ cons: •₁ car cdr) •₁) an Array(RBMessageNode(•₀ car cdr + •₁) •₀) an Array(RBMessageNode(•₀ + •₁ car cdr) •₁) an Array(RBMessageNode(•₀ car cdr - •₁) •₀) an Array(RBMessageNode(•₀ - •₁ car cdr) •₁) an Array(RBMessageNode(•₀ car cdr
	ifTrue: [ •₁ ]
	ifFalse: [ •₂ ]) •₀) an Array(RBMessageNode(•₀
	ifTrue: [ •₁ car cdr ]
	ifFalse: [ •₂ ]) •₁) an Array(RBMessageNode(•₀
	ifTrue: [ •₁ ]
	ifFalse: [ •₂ car cdr ]) •₂) an Array(RBMessageNode(•₀ car cdr car cdr) •₀))'.

	^ self exportComputationTreeOfGoal: aGoal limitedTo: 40
]
