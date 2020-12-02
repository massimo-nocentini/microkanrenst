Class {
	#name : #GoalTest,
	#superclass : #Srfi41AbstractTest,
	#instVars : [
		'sexpTheory',
		'combTheory'
	],
	#category : #'MicroKanren-Tests'
}

{ #category : #'as yet unclassified' }
GoalTest >> fives: x [
	^ (5 unifyo value: x) | [ self fives: x ] eta
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
	^ (x unifyo value: i) | [ self nats: x stage: i + o offset: o] eta
]

{ #category : #'as yet unclassified' }
GoalTest >> onState: aState [
	| aGoal aStream templateGoal |
	aStream := Run new
		goal: aGoal;
		onState: aState.
	[ :solState | templateGoal onState: solState ] >>= aStream
]

{ #category : #tests }
GoalTest >> patho: edgeo [
	| patho |
	patho := nil.
	patho := [ :x :y | 
	(edgeo value: x value: y)
		|
			[ :z | (edgeo value: x value: z) , (patho value: z value: y) ] fresh ]
		tabled.
	^ patho
]

{ #category : #'accessing structure variables' }
GoalTest >> repeat: x value: i [
	^ self nats: x stage: i offset: 0
]

{ #category : #initialization }
GoalTest >> setUp [
	sexpTheory := Theory sexp.
	combTheory := CombinatoricsTheory new
]

{ #category : #'as yet unclassified' }
GoalTest >> swappedfives: x [
	^ [ self fives: x ] eta | (5 unifyo value: x)
]

{ #category : #'as yet unclassified' }
GoalTest >> teaCupSpoon: x [

	^ Goal cond e
		  if: (x unifyo value: #tea) then: true asGoal;
		  if: (x unifyo value: #cup) then: true asGoal;
		  if: (x unifyo value: #spoon) then: true asGoal;
		  yourself
]

{ #category : #'as yet unclassified' }
GoalTest >> teacup: x [

	^ Goal cond e
		  if: (x unifyo value: #tea) then: true asGoal;
		  if: (x unifyo value: #cup) then: true asGoal;
		  yourself
]

{ #category : #'as yet unclassified' }
GoalTest >> testAlphaRuleo [
	| g µ |
	µ := Theory sexp.
	g := [ :x :y | µ alphaRuleo value: x value: y ] fresh.
	self assert: g solutions isEmpty.
	g := [ [ :x :y | 
	(x unifyo value: 3) , (y unifyo value: 3)
		, (µ alphaRuleo value: x value: y) ] fresh ] eta.
	self
		assert: g solutions
		equals: {Var tautology}
		modulo: #asOrderedCollection.
	g := [ [ :x :y | 
	(x unifyo value: 3) , (y unifyo value: 4)
		, (µ alphaRuleo value: x value: y) ] fresh ] eta.
	self assert: g solutions isEmpty.
	g := [ :x :y | (x unifyo value: y) , (µ alphaRuleo value: x value: y) ]
		fresh.
	self
		assert: g solutions
		equals:
			{{0 asReifiedVar.
			0 asReifiedVar}}
		modulo: #asOrderedCollection.
	g := [ :x :y | (µ alphaRuleo value: x value: y) , (x unifyo value: y) ]
		fresh.
	self assert: g solutions isEmpty
]

{ #category : #tests }
GoalTest >> testAppendo [
	| g |
	g := [ :l | 
	sexpTheory appendo
		value: #(#a #b #c) asCons
		value: #(#d #e) asCons
		value: l ] fresh.
	self
		assert: g solutions
		equals: {#(#a #b #c #d #e) asCons}
		modulo: #asOrderedCollection.
	g := [ :l | 
	sexpTheory appendo
		value: #(#a #b #c) asCons
		value: (#(#d) asConsWithCdr: l)
		value: #(#a #b #c #d #e) asCons ] fresh.
	self
		assert: g solutions
		equals: {(#e cons: nil)}
		modulo: #asOrderedCollection.
	g := [ :l | 
	sexpTheory appendo
		value: #(#a #b #c) asCons
		value: (#(#d) asConsWithCdr: l)
		value: (#(#a #b #c #d) asConsWithCdr: #e) ] fresh.
	self assert: g solutions equals: {#e} modulo: #asOrderedCollection
]

{ #category : #'as yet unclassified' }
GoalTest >> testBagOf [
	| g |
	g := [ :list | 
	[ :mother :child :cdr :cddr | 
	| bagOfGoal |
	bagOfGoal := (DescendTestPredicate value: mother value: child)
		bagOf:
			{mother.
			child}
		groupBy: [ :m :c | {m} ]
		template: [ :m :c | c ]
		value: cddr.
	bagOfGoal , (sexpTheory conso value: mother value: cdr value: list)
		, (sexpTheory conso value: child value: cddr value: cdr) ] fresh ]
		fresh.
	self
		assert: g solutions
		equals:
			{(#laura cons: (0 asReifiedVar cons: #(#rose))).
			(#caroline cons: (0 asReifiedVar cons: #(#rose #laura))).
			(#martha
				cons: (0 asReifiedVar cons: #(#charlotte #caroline #laura #rose))).
			(#charlotte cons: (0 asReifiedVar cons: #(#caroline #laura #rose)))}
		modulo: #asOrderedCollection.
	g := [ :list | 
	[ :mother :child | 
	(DescendTestPredicate value: mother value: child)
		bagOf:
			{mother.
			child}
		groupBy: [ :m :c | {} ]
		template: [ :m :c | c ]
		value: list ] fresh ] fresh.
	self
		assert: g solutions
		equals:
			#(#(#charlotte #caroline #rose #rose #laura #laura #caroline #laura #rose #rose))
		modulo: #asOrderedCollection.
	g := [ :list | 
	[ :groups | 
	| bagOfGoal |
	bagOfGoal := [ :mother :child | 
	(DescendTestPredicate value: mother value: child)
		bagOf:
			{mother.
			child}
		groupBy: [ :m :c | {m} ]
		template: [ :m :c | c ]
		value: groups ] fresh.
	bagOfGoal findAll: {groups} template: [ :gr | gr ] value: list ]
		fresh ] fresh.
	self
		assert: g solutions
		equals:
			#(#(#(#rose) #(#rose #laura) #(#charlotte #caroline #laura #rose) #(#caroline #laura #rose)))
		modulo: #asOrderedCollection.
	g := [ :list | 
	[ :groups :mother :child | 
	((DescendTestPredicate value: mother value: child)
		bagOf:
			{mother.
			child}
		groupBy: [ :m :c | {m} ]
		template: [ :m :c | c ]
		value: groups)
		bagOf:
			{mother.
			child.
			groups}
		groupBy: [ :m :c :gr | {} ]
		template: [ :a :c :gr | gr ]
		value: list ] fresh ] fresh.
	self
		assert: g solutions
		equals:
			#(#(#(#rose) #(#rose #laura) #(#charlotte #caroline #laura #rose) #(#caroline #laura #rose)))
		modulo: #asOrderedCollection
]

{ #category : #tests }
GoalTest >> testCaro [

	| g µ |
	µ := Theory sexp.
	g := [ :r | µ caro value: 'acorn' asCons value: r ] fresh.
	self assert: g solutions equals: { $a } modulo: #asOrderedCollection.
	g := [ :r | 
	     [ :x :y | 
	     (µ caro value: { #grape. #raisin. #pear } asCons value: x)
	     , (µ caro
			      value: { 
					      (#a cons: nil).
					      (#b cons: nil).
					      (#c cons: nil) } asCons
			      value: y) , (µ conso value: x value: y value: r) ] fresh ]
		     fresh.
	self
		assert: g solutions
		equals: { { #grape. #a } asCons }
		modulo: #asOrderedCollection
]

{ #category : #tests }
GoalTest >> testCdro [
	| g µ |
	µ := Theory sexp.
	g := [ :r | 
	[ :d | (µ cdro value: 'acorn' asCons value: d) , (µ caro value: d value: r) ]
		fresh ] fresh.
	self assert: g solutions equals: {$c} modulo: #asOrderedCollection.
	g := [ :r | 
	[ :x :y | 
	(µ cdro value: {#grape . #raisin . #pear} asCons value: x)
		,
			(µ caro
				value:
					{(#a cons: nil).
					(#b cons: nil).
					(#c cons: nil)} asCons
				value: y) , (µ conso value: x value: y value: r) ] fresh ] fresh.
	self
		assert: g solutions
		equals:
			{{{#raisin . #pear}.
			#a} asCons}
		modulo: #asOrderedCollection.
	g := [ µ cdro value: 'acorn' asCons value: 'corn' asCons ] fresh.
	self
		assert: g solutions
		equals: {Var tautology}
		modulo: #asOrderedCollection.
	g := [ :r | µ cdro value: 'acorn' asCons value: 'acorn' asCons ]
		fresh.
	self assert: g solutions isEmpty.
	g := [ :r | 
	µ cdro
		value: 'corn' asCons
		value:
			{r.
			$r.
			$n} asCons ] fresh.
	self assert: g solutions equals: {$o} modulo: #asOrderedCollection.
	g := [ :l | 
	[ :x | (µ caro value: l value: $a) , (µ cdro value: l value: 'corn' asCons) ]
		fresh ] fresh.
	self
		assert: g solutions
		equals: {'acorn' asCons}
		modulo: #asOrderedCollection
]

{ #category : #'as yet unclassified' }
GoalTest >> testConde [
	| g |
	g := (LinkedList new
		add: false asGoal -> true asGoal;
		yourself) cond e.
	self assert: g solutions isEmpty.
	g := (LinkedList new
		add: false asGoal -> false asGoal;
		add: true asGoal -> true asGoal;
		yourself) cond e.
	self
		assert: g solutions
		equals: {Var tautology}
		modulo: #asOrderedCollection.
	g := [ :x | 
	(LinkedList new
		add: (x unifyo value: #olive) -> true asGoal;
		add: (x unifyo value: #apple) -> false asGoal;
		add: (x unifyo value: #oil) -> true asGoal;
		yourself) cond e ] fresh.
	self
		assert: g solutions
		equals: {#olive . #oil}
		modulo: #asOrderedCollection.
	g := [ :x | 
	(LinkedList new
		add: (x unifyo value: #olive) -> true asGoal;
		add: (x unifyo value: #apple) -> false asGoal;
		add: (x unifyo value: #oil) -> true asGoal;
		yourself) cond e ] fresh.
	self
		assert: (g solutions next: 1)
		equals: {#olive}
		modulo: #asOrderedCollection.
	g := [ :x :y | 
	(LinkedList new
		add: (x unifyo value: #split) -> (y unifyo value: #pea);
		add: (x unifyo value: #navy) -> (y unifyo value: #bean);
		yourself) cond e ] fresh.
	self
		assert: g solutions
		equals: (Array with: {#split . #pea} with: {#navy . #bean})
		modulo: #asOrderedCollection.
	g := [ :x :y | 
	Goal cond e
		if: (self teacup: x) , (y unifyo value: true) then: true asGoal;
		if: (x unifyo value: true) then: (y unifyo value: false);
		if: true asGoal then: true asGoal;
		yourself ] fresh.
	self
		assert: g solutions
		equals:
			(Array
				with: {#tea . true}
				with: {#cup . true}
				with: {true . false}
				with:
					{0 asReifiedVar.
					1 asReifiedVar})
		modulo: #asOrderedCollection.
	g := [ :x | 
	(LinkedList new
		add: (x unifyo value: #olive) -> true asGoal;
		add: (x unifyo value: 5) -> (self fives: x);
		add: (x unifyo value: #oil) -> true asGoal;
		yourself) cond e ] fresh.
	self
		assert: (g solutions next: 10)
		equals: {#olive . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5}
		modulo: #asOrderedCollection.
	g := [ :x | 
	(LinkedList new
		add: (x unifyo value: #olive) -> true asGoal;
		add: (self fives: x) -> false asGoal;
		add: (x unifyo value: #oil) -> true asGoal;
		yourself) cond e
	"this line makes cond a divergent goal" ] fresh
	"self
	assert: (g solutions next: 10)
	equals: {#olive . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5}"
]

{ #category : #tests }
GoalTest >> testConj [
	| g |
	g := [ :q | false asGoal , (true unifyo value: q) ] fresh.
	self assert: g solutions isEmpty.
	g := [ :q | true asGoal , (false unifyo value: q) ] fresh.
	self assert: g solutions equals: {false} modulo: #asOrderedCollection.
	g := [ :a | (3 unifyo value: a) , (4 unifyo value: a) ] fresh.
	self assert: g solutions isEmpty.
	g := [ :a | ((3 unifyo value: a) , (4 unifyo value: a)) | (a unifyo value: 0) ]
		fresh.
	self assert: g solutions equals: {0} modulo: #asOrderedCollection.
	g := [ :a | (a unifyo value: 4) , (4 unifyo value: a) ] fresh.
	self assert: g solutions equals: {4} modulo: #asOrderedCollection.
	g := [ :a | (3 unifyo value: a) , [ :b | 4 unifyo value: b ] fresh ]
		fresh.
	self assert: g solutions equals: {3} modulo: #asOrderedCollection.
	g := [ :a :b | (3 unifyo value: a) , (4 unifyo value: b) ] fresh.
	self
		assert: g solutions
		equals: {{3 . 4}}
		modulo: #asOrderedCollection.
	g := [ :x :y | (x unifyo value: 3) , (y unifyo value: 4) ] fresh.
	self
		assert: g solutions
		equals: {{3 . 4}}
		modulo: #asOrderedCollection
]

{ #category : #tests }
GoalTest >> testConso [
	| g µ |
	µ := Theory sexp.
	g := µ conso
		value: 'abc' asCons
		value: 'de' asCons
		value: 'abcde' asCons.
	self assert: g solutions equals: {} modulo: #asOrderedCollection.
	g := [ :l | µ conso value: 'abc' asCons value: 'de' asCons value: l ]
		fresh.
	self
		assert: g solutions
		equals:
			{{{$a . $b . $c}.
			$d.
			$e} asCons}
		modulo: #asOrderedCollection.
	g := [ :l | µ conso value: #(#a #b #c) asCons value: #(#(#d #e)) asCons value: l ]
		fresh.
	self
		assert: g solutions
		equals: {#(#(#a #b #c) #(#d #e)) asCons}
		modulo: #asOrderedCollection.
	g := [ :l | 
	µ conso
		value: l
		value: #(#b #c #d) asCons
		value: #(#a #b #c #d) asCons ] fresh.
	self assert: g solutions equals: {#a} modulo: #asOrderedCollection.
	g := [ :l | 
	[ :x :y :z | 
	(l unifyo
		value:
			{#e.
			#a.
			#d.
			x} asCons)
		,
			(µ conso
				value: y
				value:
					{#a.
					z.
					#c} asCons
				value: l) ] fresh ] fresh.
	self
		assert: g solutions
		equals: {#(#e #a #d #c) asCons}
		modulo: #asOrderedCollection
]

{ #category : #tests }
GoalTest >> testCut [

	| g |
	g := [ :x :y | 
	     (x unifyo value: 1) | (x unifyo value: 2) | (x unifyo value: 3)
	     !
	     ((y unifyo value: 1) | (y unifyo value: 2) | (y unifyo value: 3)) ]
		     fresh.
	self
		assert: g solutions
		equals: #( #( 1 1 ) #( 1 3 ) #( 1 2 ) )
		modulo: #asOrderedCollection
]

{ #category : #tests }
GoalTest >> testCutOverMultipleRules [

	"a(X) :- b(X), !, c(X).
	 a(X) :- d(X).
	 b(1).
	 b(4).
	 c(3).
	 d(4)."

	| g |
	g := [ :x | 
	     (x unifyo value: 1) | (x unifyo value: 4) | (x unifyo value: 4)
	     ! (x unifyo value: 3) ] fresh.
	self assert: g solutions equals: #(  ) modulo: #asOrderedCollection
]

{ #category : #tests }
GoalTest >> testCutUnifyThenFail [

	| g |
	g := [ :x | 
	     (x unifyo value: 1) | (x unifyo value: 2) | (x unifyo value: 3)
	     ! (x unifyo value: 2) ] fresh.
	self assert: g solutions equals: #(  ) modulo: #asOrderedCollection.
	g := [ :x | 
	     (x unifyo value: 1) | (x unifyo value: 2) | (x unifyo value: 3)
	     , (x unifyo value: 2) ] fresh.
	self assert: g solutions equals: #( 2 ) modulo: #asOrderedCollection
]

{ #category : #'as yet unclassified' }
GoalTest >> testDisj [
	| g |
	g := [ :a | (3 unifyo value: a) | (4 unifyo value: a) ] fresh.
	self assert: g solutions equals: {3 . 4} modulo: #asOrderedCollection.
	g := [ :a | (4 unifyo value: a) | (3 unifyo value: a) ] fresh.
	self assert: g solutions equals: {4 . 3} modulo: #asOrderedCollection.
	g := [ :a | (3 unifyo value: a) | (3 unifyo value: a) ] fresh.
	self assert: g solutions equals: {3 . 3} modulo: #asOrderedCollection.
	g := [ :a | (3 unifyo value: a) | (4 unifyo value: a) | (5 unifyo value: a) ]
		fresh.
	self
		assert: g solutions
		equals: {3 . 5 . 4}
		modulo: #asOrderedCollection.
	g := [ :a | (3 unifyo value: a) | ((4 unifyo value: a) | (5 unifyo value: a)) ]
		fresh.
	self
		assert: g solutions
		equals: {3 . 4 . 5}
		modulo: #asOrderedCollection
]

{ #category : #'as yet unclassified' }
GoalTest >> testFail [
	self assert: false asGoal solutions isEmpty
]

{ #category : #'as yet unclassified' }
GoalTest >> testFindAll [
	| g |
	g := [ :b | DescendTestPredicate value: #martha value: b ] fresh.
	self
		assert: g solutions
		equals: #(charlotte caroline laura rose)
		modulo: #asOrderedCollection.
	g := [ :list | 
	[ :b | 
	(DescendTestPredicate value: #martha value: b)
		findAll: {b}
		template: [ :_b | Array with: #fromMartha with: _b ]
		value: list ] fresh ] fresh.
	self
		assert: g solutions
		equals:
			#(#(#(#fromMartha #charlotte) #(#fromMartha #caroline) #(#fromMartha #laura) #(#fromMartha #rose)))
		modulo: #asOrderedCollection.
	g := [ :list | 
	[ :b :y | 
	(DescendTestPredicate value: #martha value: b)
		findAll:
			{b.
			y}
		template: [ :_b :_y | _y ]
		value: list ] fresh ] fresh.
	self
		assert: g solutions
		equals:
			{{0 asReifiedVar.
			0 asReifiedVar.
			0 asReifiedVar.
			0 asReifiedVar}}
		modulo: #asOrderedCollection.
	g := [ :list | 
	[ :b :cdr | 
	((DescendTestPredicate value: #mary value: b)
		findAll: {b}
		template: [ :_b | _b ]
		value: cdr)
		, (sexpTheory conso value: #empty value: cdr value: list) ] fresh ]
		fresh.
	self
		assert: g solutions
		equals: #(empty) asCons
		modulo: #asOrderedCollection.
	g := [ :list | 
	[ :mother :child | 
	(DescendTestPredicate value: mother value: child)
		findAll:
			{mother.
			child}
		template: [ :m :c | c ]
		value: list ] fresh ] fresh.
	self
		assert: g solutions
		equals:
			#(#(#charlotte #caroline #rose #rose #laura #laura #caroline #laura #rose #rose))
		modulo: #asOrderedCollection
]

{ #category : #'as yet unclassified' }
GoalTest >> testFives [
	| g |
	g := [ :x | self fives: x ] fresh.
	self
		assert: (g solutions next: 10)
		equals: {5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5}
		modulo: #asOrderedCollection.
	g := [ :x | self swappedfives: x ] fresh.
	self
		assert: (g solutions next: 10)
		equals: {5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5}
		modulo: #asOrderedCollection
]

{ #category : #tests }
GoalTest >> testLengtho [
	| g µ |
	self skip.
	µ := Theory sexp.
	g := µ lengtho value: {} asCons value: 0 asConsedBinaryRepr.
	self
		assert: g solutions
		equals: {Var tautology}
		modulo: #asOrderedCollection.
	g := [ :n | µ lengtho value: {#anElement} asCons value: n ] fresh.
	self
		assert: (g solutions next: 1)
		equals: {1 asConsedBinaryRepr}
		modulo: #asOrderedCollection.
	g := µ lengtho
		!!
			{(1 to: 10) asCons.
			10 asConsedBinaryRepr}.
	self
		assert: g solutions
		equals: {Var tautology}
		modulo: #asOrderedCollection.
	g := [ :lst | 
	µ lengtho
		!!
			{lst.
			3 asConsedBinaryRepr} ] fresh.
	self
		assert: g solutions
		equals:
			{{0 asReifiedVar.
			1 asReifiedVar.
			2 asReifiedVar} asCons}
		modulo: #asOrderedCollection.
	self flag: 'FIXME: workaround to preveent unbounded computation'.
	g := [ :n | 
	µ lengtho
		!!
			{(1 to: 10) asCons.
			n} ] fresh.
	self
		assert: (g solutions next: 1)
		equals: {10 asConsedBinaryRepr}
		modulo: #asOrderedCollection
]

{ #category : #'as yet unclassified' }
GoalTest >> testNats [
	| g M |
	M := 1000.
	g := [ :x | self nats: x ] fresh.
	self
		assert: (g solutions next: M)
		equals: (0 to: M - 1)
		modulo: #asOrderedCollection
]

{ #category : #'as yet unclassified' }
GoalTest >> testSucceed [
	"A relation that can *always* be satisfied, regardless of free
	variables that appear in it, is called _tautology_."

	self
		assert: true asGoal solutions
		equals: {Var tautology}
		modulo: #asOrderedCollection.
	self
		assert: (true asGoal | false asGoal) solutions
		equals: {Var tautology}
		modulo: #asOrderedCollection.
	self
		assert: (true asGoal | true asGoal) solutions
		equals:
			{Var tautology.
			Var tautology}
		modulo: #asOrderedCollection.
	self
		assert: (true asGoal , true asGoal) solutions
		equals: {Var tautology}
		modulo: #asOrderedCollection
]

{ #category : #tests }
GoalTest >> testTabling [
	| g patho |
	self skip.
	patho := self
		patho:
			{(#a -> #b).
			(#b -> #a).
			(#b -> #d)} asGraph asGoal.
	g := [ :x | patho value: #a value: x ] fresh.
	self assert: g solutions contents equals: #(#b #a #d).
	patho := self
		patho:
			{(#a -> #b).
			(#b -> #c).
			(#c -> #d).
			(#d -> #a).
			(#d -> #b)} asGraph asGoal.
	g := [ :x | patho value: #c value: x ] fresh.
	self assert: g solutions contents equals: #(#d #a #b #c)
]

{ #category : #tests }
GoalTest >> testTablingAnswersInsteadOfSubstitutions [
	| fº gº |
	self skip.
	fº := [ :z | z unifyo value: 6 ] tabled.
	gº := [ :x :y | 
	Goal cond e
		if: (x unifyo value: 5) then: (fº value: y);
		if: true asGoal then: (fº value: y) ] fresh.
	self
		assert:
			{{5 . 6}.
			{0 asReifiedVar.
			6}}
		equals: gº solutions contents
]

{ #category : #tests }
GoalTest >> testTablingMutuallyRecursive [
	| fº gº |
	self skip.
	gº := nil.
	fº := [ :x | 
	Goal cond e
		if: (x unifyo value: 0) then: true asGoal;
		if: true asGoal then: (gº value: x);
		yourself ].
	gº := [ :x | 
	Goal cond e
		if: (x unifyo value: 1) then: true asGoal;
		if: true asGoal then: (fº value: x);
		yourself ].
	"self
	assert: {0. 1}
	equals: ([:q | fº value: q] fresh solutions next: 2) contents."
	fº := [ :x | 
	Goal cond e
		if: (x unifyo value: 0) then: true asGoal;
		if: true asGoal then: (gº value: x);
		yourself ] tabled.
	gº := [ :x | 
	Goal cond e
		if: (x unifyo value: 1) then: true asGoal;
		if: true asGoal then: (fº value: x);
		yourself ].
	self
		assert: {0 . 1}
		equals: [ :q | fº value: q ] fresh solutions contents.
	fº := [ :x | 
	Goal cond e
		if: (x unifyo value: 0) then: true asGoal;
		if: true asGoal then: (gº value: x);
		yourself ].
	gº := [ :x | 
	Goal cond e
		if: (x unifyo value: 1) then: true asGoal;
		if: true asGoal then: (fº value: x);
		yourself ] tabled.
	self
		assert: {0 . 1 . 0}
		equals: [ :q | fº value: q ] fresh solutions contents
]

{ #category : #'as yet unclassified' }
GoalTest >> testTeaCup [
	| g |
	g := [ :x | self teacup: x ] fresh.
	self
		assert: g solutions
		equals: {#tea . #cup}
		modulo: #asOrderedCollection.
	g := [ :x :y :z | (self teacup: x) , ((self teacup: y) , (self teacup: z)) ]
		fresh.
	self
		assert: g solutions
		equals:
			{#(#tea #tea #tea).
			#(#cup #tea #tea).
			#(#tea #cup #tea).
			#(#cup #cup #tea).
			#(#tea #tea #cup).
			#(#cup #tea #cup).
			#(#tea #cup #cup).
			#(#cup #cup #cup)}
		modulo: #asOrderedCollection
]

{ #category : #'as yet unclassified' }
GoalTest >> testUnify [
	| g |
	g := 3 unifyo value: 3.
	self
		assert: g solutions
		equals: {Var tautology}
		modulo: #asOrderedCollection.
	g := 4 unifyo value: 3.
	self assert: g solutions isEmpty.
	"symmetry"
	g := [ :q | 4 unifyo value: q ] fresh.
	self assert: g solutions equals: {4} modulo: #asOrderedCollection.
	g := [ :q | q unifyo value: 4 ] fresh.
	self assert: g solutions equals: {4} modulo: #asOrderedCollection.
	"reification"
	g := [ :q | true asGoal ] fresh.
	self
		assert: g solutions
		equals: {0 asReifiedVar}
		modulo: #asOrderedCollection.
	g := [ :q :r | true asGoal ] fresh.
	self
		assert: g solutions
		equals:
			(Array
				with:
					{0 asReifiedVar.
					1 asReifiedVar})
		modulo: #asOrderedCollection.
	g := [ :r | [ :x :y | r unifyo value: (Array with: x with: y) ] fresh ]
		fresh.
	self
		assert: g solutions
		equals:
			(Array
				with:
					{0 asReifiedVar.
					1 asReifiedVar})
		modulo: #asOrderedCollection.
	g := [ :r | [ :x :y | r unifyo value: (LinkedList with: x with: y) ] fresh ]
		fresh.
	self
		assert: g solutions
		equals:
			(Array
				with:
					{0 asReifiedVar.
					1 asReifiedVar})
		modulo: #asOrderedCollection.
	g := [ :r | [ :x :y | (LinkedList with: x with: y) unifyo value: r ] fresh ]
		fresh.
	self
		assert: g solutions
		equals:
			(Array
				with:
					{0 asReifiedVar.
					1 asReifiedVar})
		modulo: #asOrderedCollection.
	g := [ :r | 
	[ :x :y | 
	(LinkedList
		with: x
		with: y
		with: x
		with: y) unifyo value: r ] fresh ] fresh.
	self
		assert: g solutions
		equals:
			(Array
				with:
					{0 asReifiedVar.
					1 asReifiedVar.
					0 asReifiedVar.
					1 asReifiedVar})
		modulo: #asOrderedCollection.
	g := [ :r | 
	[ :x :y | 
	(LinkedList with: x with: r) unifyo
		value: (LinkedList with: 1 with: y) ] fresh ].
	self
		assert: g fresh solutions
		equals: {0 asReifiedVar}
		modulo: #asOrderedCollection.
	"sharing"
	g := [ :r | [ :x | (r unifyo value: x) , (x unifyo value: true) ] fresh ].
	self
		assert: g fresh solutions
		equals: {true}
		modulo: #asOrderedCollection
]
