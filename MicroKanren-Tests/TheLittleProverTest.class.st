"
A RBProgramNodeIdentityVisitorTest is a test class for testing the behavior of RBProgramNodeIdentityVisitor
"
Class {
	#name : #TheLittleProverTest,
	#superclass : #Srfi41AbstractTest,
	#category : #'MicroKanren-Tests'
}

{ #category : #predicates }
TheLittleProverTest >> atomConsº [

	"
	(dethm atom/cons (x y)
	  (equal (atom (cons x y)) 'nil))"

	^ [ :a :b | 
	  ([ :x :y :ast | ast unifyo value: a ] asGoalWithASTof: [ :x :y | 
		   (x cons: y) isAtom ])
	  , ([ :ast | ast unifyo value: b ] asGoalWithASTof: [ false ]) ]
]

{ #category : #tests }
TheLittleProverTest >> carConso [

	^ [ :a :b | 
	  ([ :x :y | (x cons: y) car ] unifyo value: a)
	  , ([ :x | x ] unifyo value: b) ]
]

{ #category : #tests }
TheLittleProverTest >> cdrConso [

	^ [ :a :b | 
	  ([ :x :y | (x cons: y) cdr ] unifyo value: a)
	  , ([ :y | y ] unifyo value: b) ]
]

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
	         [ :cdr :ast | self atomConsº value: ast value: rewrite ] 
		         asGoalWithASTof: [ :cdr | (3 cons: cdr) isAtom ] ] asGoal.
	self
		assert: aGoal solutions
		equals: { [ false ] sourceNode body }
		modulo: #asOrderedCollection
]
