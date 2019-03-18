Class {
	#name : #GoalTest,
	#superclass : #TestCase,
	#instVars : [
		'sexpTheory',
		'combTheory'
	],
	#category : 'MicroKanren-testing'
}

{ #category : #'as yet unclassified' }
GoalTest >> fives: x [
	^ (5 unifyWith: x) | [ self fives: x ] eta
]

{ #category : #'as yet unclassified' }
GoalTest >> nats: x [
	^ self nats: x stage: 0
]

{ #category : #'as yet unclassified' }
GoalTest >> nats: x stage: i [
	^ self nats: x stage: i offset: 1
]

{ #category : #'as yet unclassified' }
GoalTest >> nats: x stage: i offset: o [
	^ (x unifyWith: i) | [ self nats: x stage: i + o ] eta
]

{ #category : #'accessing structure variables' }
GoalTest >> repeat: x value: i [
	^ self nats: x stage: i offset: 0
]

{ #category : #initialization }
GoalTest >> setUp [
	sexpTheory := SexpTheory new.
	combTheory := CombinatoricsTheory new
]

{ #category : #'as yet unclassified' }
GoalTest >> swappedfives: x [
	^ [ self fives: x ] eta | (5 unifyWith: x)
]

{ #category : #'as yet unclassified' }
GoalTest >> teacup: x [
	^ (LinkedList
		with: (x unifyWith: #tea) -> true asGoal
		with: (x unifyWith: #cup) -> true asGoal) cond e
]

{ #category : #tests }
GoalTest >> testAppendo [
	| g |
	g := [ :l | sexpTheory let: l be: #(a b c) asCons append: #(d e) asCons ] fresh.
	self assert: g solutions all equals: {#(a b c d e) asCons}.
	g := [ :l | sexpTheory let: #(a b c d e) asCons be: #(a b c) asCons append: (#(d) asCons: l) ]
		fresh.
	self assert: g solutions all equals: {(#e cons: nil)}.
	g := [ :l | sexpTheory let: (#(a b c d) asCons: #e) be: #(a b c) asCons append: (#(d) asCons: l) ]
		fresh.
	self assert: g solutions all equals: {#e}
]

{ #category : #tests }
GoalTest >> testCaro [
	| g |
	g := [ :r | sexpTheory let: r car: 'acorn' ] fresh.
	self assert: g solutions all equals: {$a}.
	g := [ :r | 
	[ :x :y | 
	| l m vl |
	l := LinkedList new
		add: #grape;
		add: #raisin;
		add: #pear;
		yourself.
	m := {(#a cons: nil).
	(#b cons: nil).
	(#c cons: nil)}.
	vl := x cons: y.
	(sexpTheory let: x car: l) , (sexpTheory let: y car: m) , (vl unifyWith: r)
		, (r unifyWith: vl) ] fresh ] fresh.
	"	(l caro: x) , (m caro: y) , (vl unifyWith: r) , (r unifyWith: vl) ] fresh ] fresh."
	self assert: g solutions all equals: {{#grape . #a} asCons}
]

{ #category : #tests }
GoalTest >> testCdro [
	| g |
	g := [ :r | [ :d | (sexpTheory let: d cdr: 'acorn') , (sexpTheory let: r car: d) ] fresh ]
		fresh.
	self assert: g solutions all equals: {$c}.
	g := [ :r | 
	[ :x :y | 
	| l m vl |
	l := LinkedList new
		add: #grape;
		add: #raisin;
		add: #pear;
		yourself.
	m := LinkedList new
		add: (#a cons: nil);
		add: (#b cons: nil);
		add: (#c cons: nil);
		yourself.
	vl := x cons: y.
	(sexpTheory let: x cdr: l) , (sexpTheory let: y car: m) , (vl unifyWith: r)
		, (r unifyWith: vl) ] fresh ] fresh.
	self
		assert: g solutions all
		equals:
			{{{#raisin . #pear}.
			#a} asCons}.
	g := [ :r | sexpTheory let: 'corn' cdr: 'acorn' ] fresh.
	self assert: g solutions all equals: {0 asReifiedVar}.
	g := [ :r | sexpTheory let: 'acorn' cdr: 'acorn' ] fresh.
	self assert: g solutions all equals: {}.
	g := [ :r | 
	sexpTheory
		let:
			{r.
			$r.
			$n}
		cdr: 'corn' ] fresh.
	self assert: g solutions all equals: {$o}.
	g := [ :l | [ :x | (sexpTheory let: $a car: l) , (sexpTheory let: 'corn' cdr: l) ] fresh ]
		fresh.
	self assert: g solutions all equals: {'acorn' asCons}
]

{ #category : #'as yet unclassified' }
GoalTest >> testConde [
	| g |
	g := (LinkedList new
		add: false asGoal -> true asGoal;
		yourself) cond e else: false asGoal.
	self assert: g solutions all equals: {}.
	g := (LinkedList new
		add: false asGoal -> false asGoal;
		yourself) cond e else: true asGoal.
	self assert: g solutions all equals: {Var tautology}.
	g := [ :x | 
	(LinkedList new
		add: (x unifyWith: #olive) -> true asGoal;
		add: (x unifyWith: #apple) -> false asGoal;
		add: (x unifyWith: #oil) -> true asGoal;
		yourself) cond e ] fresh.
	self assert: g solutions all equals: {#olive . #oil}.
	g := [ :x | 
	(LinkedList new
		add: (x unifyWith: #olive) -> true asGoal;
		add: (x unifyWith: #apple) -> false asGoal;
		add: (x unifyWith: #oil) -> true asGoal;
		yourself) cond e ] fresh.
	self assert: (g solutions atMost: 1) equals: {#olive}.
	g := [ :x :y | 
	(LinkedList new
		add: (x unifyWith: #split) -> (y unifyWith: #pea);
		add: (x unifyWith: #navy) -> (y unifyWith: #bean);
		yourself) cond e ] fresh.
	self assert: g solutions all equals: (Array with: {#split . #pea} with: {#navy . #bean}).
	g := [ :x :y | 
	Goal cond e
		if: (self teacup: x) , (y unifyWith: true) then: true asGoal;
		if: (x unifyWith: true) then: (y unifyWith: false);
		else: true asGoal ] fresh.
	self
		assert: g solutions all
		equals:
			(Array
				with: {#tea . true}
				with: {#cup . true}
				with: {true . false}
				with:
					{0 asReifiedVar.
					1 asReifiedVar}).
	g := [ :x | 
	(LinkedList new
		add: (x unifyWith: #olive) -> true asGoal;
		add: (x unifyWith: 5) -> (self fives: x);
		add: (x unifyWith: #oil) -> true asGoal;
		yourself) cond e ] fresh.
	self
		assert: (g solutions atMost: 10)
		equals: {#olive . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5}.
	g := [ :x | 
	(LinkedList new
		add: (x unifyWith: #olive) -> true asGoal;
		add: (self fives: x) -> false asGoal;
		"this line makes cond a divergent goal"
			add: (x unifyWith: #oil) -> true asGoal;
		yourself) cond e ] fresh
	"self
		assert: (g solutions next: 10)
		equals: {#olive . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5}"
]

{ #category : #tests }
GoalTest >> testConj [
	| g |
	g := [ :q | false asGoal , (true unifyWith: q) ] fresh.
	self assert: g solutions all equals: {}.
	g := [ :q | true asGoal , (false unifyWith: q) ] fresh.
	self assert: g solutions all equals: {false}.
	g := [ :a | (3 unifyWith: a) , (4 unifyWith: a) ] fresh.
	self assert: g solutions all equals: {}.
	g := [ :a | (a unifyWith: 4) , (4 unifyWith: a) ] fresh.
	self assert: g solutions all equals: {4}.
	g := [ :a | (3 unifyWith: a) , [ :b | 4 unifyWith: b ] fresh ] fresh.
	self assert: g solutions all equals: {3}.
	g := [ :a :b | (3 unifyWith: a) , (4 unifyWith: b) ] fresh.
	self assert: g solutions all equals: (LinkedList with: {3 . 4})
]

{ #category : #'accessing structure variables' }
GoalTest >> testConjInterleaved [
	| g |
	g := [ :x :y | (x unifyWith: 5) & (y unifyWith: 6) ] fresh.
	self assert: (g solutions atMost: 5) equals: {#(5 6)}
]

{ #category : #tests }
GoalTest >> testConso [
	| g |
	g := [ :l | sexpTheory let: l be: #(a b c) cons: #(d e) ] fresh.
	self assert: g solutions all equals: {#(#(a b c) d e) asCons}.
	g := [ :l | sexpTheory let: l be: #(a b c) cons: #(#(d e)) ] fresh.
	self assert: g solutions all equals: {#(#(a b c) #(d e)) asCons}.
	g := [ :l | sexpTheory let: #(a b c d) be: l cons: #(b c d) ] fresh.
	self assert: g solutions all equals: {#a}.
	g := [ :l | 
	[ :x :y :z | 
	(l
		unifyWith:
			(LinkedList new
				add: #e;
				add: #a;
				add: #d;
				add: x;
				asCons)) , (sexpTheory let: l be: y cons: (LinkedList with: #a with: z with: #c)) ]
		fresh ] fresh.
	self assert: g solutions all equals: {#(e a d c) asCons}
]

{ #category : #'as yet unclassified' }
GoalTest >> testDisj [
	| g |
	g := [ :a | (3 unifyWith: a) | (4 unifyWith: a) ] fresh.
	self assert: g solutions all equals: {3 . 4}.
	g := [ :a | (3 unifyWith: a) | (3 unifyWith: a) ] fresh.
	self assert: g solutions all equals: {3 . 3}
]

{ #category : #tests }
GoalTest >> testDycko [
	| g |
	g := [ :alpha | combTheory dycko: alpha ] fresh.
	self
		assert: (g solutions atMost: 20)
		equals:
			({nil . '()' . '(())' . '()()' . '(()())' . '()(())' . '(())()' . '()()()' . '(()()())'.
			'()(()())' . '(())(())' . '()()(())' . '((()))' . '()(())()' . '(())()()' . '()()()()'.
			'(()()()())' . '()(()()())' . '(())(()())' . '()()(()())'} collect: #asCons).
	g := [ :alpha | combTheory dycko: '(()(())()(' asCons ] fresh.	"an invalid Dyck path"
	self assert: g solutions all equals: {}
]

{ #category : #'as yet unclassified' }
GoalTest >> testFail [
	
	self assert: false asGoal solutions all equals: {}
]

{ #category : #'as yet unclassified' }
GoalTest >> testFives [
	| g |
	g := [ :x | self fives: x ] fresh.
	self assert: (g solutions atMost: 10) equals: {5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5}.
	g := [ :x | self swappedfives: x ] fresh.
	self assert: (g solutions atMost: 10) equals: {5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5}
]

{ #category : #'as yet unclassified' }
GoalTest >> testNats [
	| g M |
	M := 1000.
	g := [ :x | self nats: x ] fresh.
	self assert: (g solutions atMost: M) equals: (0 to: M - 1)
]

{ #category : #'as yet unclassified' }
GoalTest >> testSucceed [
	"A relation that can *always* be satisfied, regardless of free
	variables that appear in it, is called _tautology_."
	self assert: true asGoal solutions all equals: {Var tautology}.
	self assert: (true asGoal | false asGoal) solutions all equals: {Var tautology.}.
	self assert: (true asGoal | true asGoal) solutions all equals: {Var tautology. Var tautology}.
	self assert: (true asGoal , true asGoal) solutions all equals: {Var tautology}
]

{ #category : #'as yet unclassified' }
GoalTest >> testUnify [
	| g |
	g := 3 unifyWith: 3.
	self assert: g solutions all equals: {Var tautology}.
	g := 4 unifyWith: 3.
	self assert: g solutions all equals: {}.

	"symmetry"
	g := [ :q | 4 unifyWith: q ] fresh.
	self assert: g solutions all equals: {4}.
	g := [ :q | q unifyWith: 4 ] fresh.
	self assert: g solutions all equals: {4}.

	"reification"
	g := [ :q | true asGoal ] fresh.
	self assert: g solutions all equals: {0 asReifiedVar}.
	g := [ :q :r | true asGoal ] fresh.
	self
		assert: g solutions all
		equals:
			(Array
				with:
					{0 asReifiedVar.
					1 asReifiedVar}).
	g := [ :r | [ :x :y | r unifyWith: (Array with: x with: y) ] fresh ] fresh.
	self
		assert: g solutions all
		equals:
			(Array
				with:
					{0 asReifiedVar.
					1 asReifiedVar}).
	g := [ :r | [ :x :y | r unifyWith: (LinkedList with: x with: y) ] fresh ] fresh.
	self
		assert: g solutions all
		equals:
			(Array
				with:
					{0 asReifiedVar.
					1 asReifiedVar}).
	g := [ :r | [ :x :y | (LinkedList with: x with: y) unifyWith: r ] fresh ] fresh.
	self
		assert: g solutions all
		equals:
			(Array
				with:
					{0 asReifiedVar.
					1 asReifiedVar}).
	g := [ :r | 
	[ :x :y | 
	(LinkedList
		with: x
		with: y
		with: x
		with: y) unifyWith: r ] fresh ] fresh.
	self
		assert: g solutions all
		equals:
			(Array
				with:
					{0 asReifiedVar.
					1 asReifiedVar.
					0 asReifiedVar.
					1 asReifiedVar}).
	g := [ :r | [ :x :y | (LinkedList with: x with: r) unifyWith: (LinkedList with: 1 with: y) ] fresh ].
	self assert: g fresh solutions all equals: {0 asReifiedVar}.

	"sharing"
	g := [ :r | [ :x | (r unifyWith: x) , (x unifyWith: true) ] fresh ].
	self assert: g fresh solutions all equals: {true}
]
