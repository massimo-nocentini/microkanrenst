"
A RBProgramNodeIdentityVisitorTest is a test class for testing the behavior of RBProgramNodeIdentityVisitor
"
Class {
	#name : #RBProgramNodeIdentityVisitorTest,
	#superclass : #TestCase,
	#category : #'MicroKanren-Tests'
}

{ #category : #tests }
RBProgramNodeIdentityVisitorTest >> atomConsº [

	"
	(dethm atom/cons (x y)
	  (equal (atom (cons x y)) 'nil))"

	^ [ :a :b | 
	  ([ :x :y :ast | ast unifyo value: a ] asGoalWithASTof: [ :x :y | 
		   (x cons: y) isAtom ])
	  , ([ :ast | ast unifyo value: b ] asGoalWithASTof: [ false ]) ]
]

{ #category : #tests }
RBProgramNodeIdentityVisitorTest >> carConso [

	^ [ :a :b | 
	  ([ :x :y | (x cons: y) car ] unifyo value: a)
	  , ([ :x | x ] unifyo value: b) ]
]

{ #category : #tests }
RBProgramNodeIdentityVisitorTest >> cdrConso [

	^ [ :a :b | 
	  ([ :x :y | (x cons: y) cdr ] unifyo value: a)
	  , ([ :y | y ] unifyo value: b) ]
]

{ #category : #tests }
RBProgramNodeIdentityVisitorTest >> cons: x carcdr: y [

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
RBProgramNodeIdentityVisitorTest >> consCarCdro [

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
RBProgramNodeIdentityVisitorTest >> equal: x if: y else: z [

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
RBProgramNodeIdentityVisitorTest >> equal: x swap: y [

	^ [ :a :b | 
	  ([ x = y ] unifyo value: a) , ([ y = x ] unifyo value: b) ]
]

{ #category : #tests }
RBProgramNodeIdentityVisitorTest >> equalSameo [

	^ [ :a :b | 
	  ([ :x | x = x ] unifyo value: a) , ([ true ] unifyo value: b) ]
]

{ #category : #tests }
RBProgramNodeIdentityVisitorTest >> flapjackFalseo [

	^ [ :a :b | 
	  ([ #flapjack = false ] unifyo value: a)
	  , ([ false ] unifyo value: b) ]
]

{ #category : #tests }
RBProgramNodeIdentityVisitorTest >> if: x false: y [

	^ [ :a :b | 
	  ([ 
	   false
		   ifTrue: [ x ]
		   ifFalse: [ y ] ] unifyo value: a) , ([ y ] unifyo value: b) ]
]

{ #category : #tests }
RBProgramNodeIdentityVisitorTest >> if: x nest: y answer: z else: w [

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
RBProgramNodeIdentityVisitorTest >> if: x nest: y otherwise: z else: w [

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
RBProgramNodeIdentityVisitorTest >> if: x same: y [

	^ [ :a :b | 
	  ([ 
	   x
		   ifTrue: [ y ]
		   ifFalse: [ y ] ] unifyo value: a) , ([ y ] unifyo value: b) ]
]

{ #category : #tests }
RBProgramNodeIdentityVisitorTest >> if: x true: y [

	^ [ :a :b | 
	  ([ 
	   true
		   ifTrue: [ x ]
		   ifFalse: [ y ] ] unifyo value: a) , ([ x ] unifyo value: b) ]
]

{ #category : #tests }
RBProgramNodeIdentityVisitorTest >> isAtom: x conso: y [

	^ [ :a :b | 
	  ([ (x cons: y) isAtom ] unifyo value: a)
	  , ([ false ] unifyo value: b) ]
]

{ #category : #tests }
RBProgramNodeIdentityVisitorTest >> isAtomConso [

	^ [ :a :b | 
	  ([ :x :y | (x cons: y) isAtom ] unifyo value: a)
	  , ([ false ] unifyo value: b) ]
]

{ #category : #tests }
RBProgramNodeIdentityVisitorTest >> nilIsNilo [

	^ [ :a :b | 
	  ([ nil isNil ] unifyo value: a) , ([ true ] unifyo value: b) ]
]

{ #category : #tests }
RBProgramNodeIdentityVisitorTest >> testFirstExampleOfLittleProver [

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
RBProgramNodeIdentityVisitorTest >> testFirstExampleOfLittleProverWithLogicVars [
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
RBProgramNodeIdentityVisitorTest >> testFlapjackIsAtomConso [

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
RBProgramNodeIdentityVisitorTest >> test_atomConsº [

	self
		assert: [ :rewrite | 
			self atomConsº
				value: [ :cdr | (3 cons: cdr) isAtom ] sourceNode body
				value: rewrite ] asGoal solutions asOrderedCollection
		equals: { [ false ] sourceNode body }
]
