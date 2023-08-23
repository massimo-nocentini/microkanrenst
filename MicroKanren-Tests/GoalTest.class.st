Class {
	#name : #GoalTest,
	#superclass : #GoalAbstractTest,
	#instVars : [
		'sexpTheory',
		'combTheory'
	],
	#category : #'MicroKanren-Tests'
}

{ #category : #utilities }
GoalTest >> eternity: x [

	^ [ self eternity: x ] asGoal
]

{ #category : #utilities }
GoalTest >> fives: x [
	^ (5 unifyo value: x) | [ self fives: x ] asGoal
]

{ #category : #utilities }
GoalTest >> imagesPath [

	^ self iceWorkingDirectory / 'booklet' / 'source' / '_images'
]

{ #category : #utilities }
GoalTest >> nats: x [
	^ self nats: x stage: 0
]

{ #category : #utilities }
GoalTest >> nats: x stage: i [
	^ self nats: x stage: i offset: 1
]

{ #category : #utilities }
GoalTest >> nats: x stage: i offset: o [
	^ (x unifyo value: i) | [ self nats: x stage: i + o offset: o] asGoal
]

{ #category : #tests }
GoalTest >> patho: edgeo [
	| patho |
	patho := nil.
	patho := [ :x :y | 
	(edgeo value: x value: y)
		|
			[ :z | (edgeo value: x value: z) , (patho value: z value: y) ] asGoal ]
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

{ #category : #utilities }
GoalTest >> swappedfives: x [
	^ [ self fives: x ] asGoal | (5 unifyo value: x)
]

{ #category : #utilities }
GoalTest >> teaCupSpoon: x [

	^ Goal cond e
		  if: (x unifyo value: #tea) then: true asGoal;
		  if: (x unifyo value: #cup) then: true asGoal;
		  if: (x unifyo value: #spoon) then: true asGoal;
		  yourself
]

{ #category : #utilities }
GoalTest >> teacup: x [

	^ Goal cond e
		  if: (x unifyo value: #tea) then: true asGoal;
		  if: (x unifyo value: #cup) then: true asGoal;
		  yourself
]

{ #category : #tests }
GoalTest >> testAlphaRuleo [

	| g µ |
	µ := Theory sexp.
	g := [ :x :y | µ alphaRuleo value: x value: y ] asGoal.
	self assert: g solutions readStream upToEnd isEmpty.
	g := [ 
	     [ :x :y | 
	     (x unifyo value: 3) , (y unifyo value: 3)
	     , (µ alphaRuleo value: x value: y) ] asGoal ] asGoal.
	self
		assert: g solutions
		equals: { Var tautology }
		modulo: #asOrderedCollection.
	g := [ 
	     [ :x :y | 
	     (x unifyo value: 3) , (y unifyo value: 4)
	     , (µ alphaRuleo value: x value: y) ] asGoal ] asGoal.
	self assert: g solutions readStream upToEnd isEmpty.
	g := [ :x :y | 
	     (x unifyo value: y) , (µ alphaRuleo value: x value: y) ] asGoal.
	self
		assert: g solutions
		equals: { { 
				0 asReifiedVar.
				0 asReifiedVar } }
		modulo: #asOrderedCollection.
	g := [ :x :y | 
	     (µ alphaRuleo value: x value: y) , (x unifyo value: y) ] asGoal.
	self assert: g solutions readStream upToEnd isEmpty
]

{ #category : #tests }
GoalTest >> testAppendo [

	| g |
	g := [ :l |
	     sexpTheory appendo
		     value: #( #a #b #c ) asCons
		     value: #( #d #e ) asCons
		     value: l ] asGoal.
	self
		assert: g solutions
		equals: { #( #a #b #c #d #e ) asCons }
		modulo: #asOrderedCollection.
	g := [ :l |
	     sexpTheory appendo
		     value: #( #a #b #c ) asCons
		     value: (#( #d ) asConsWithCdr: l)
		     value: #( #a #b #c #d #e ) asCons ] asGoal.
	self
		assert: g solutions
		equals: { (#e cons: nil) }
		modulo: #asOrderedCollection.
	g := [ :l |
	     sexpTheory appendo
		     value: #( #a #b #c ) asCons
		     value: (#( #d ) asConsWithCdr: l)
		     value: (#( #a #b #c #d ) asConsWithCdr: #e) ] asGoal.
	self assert: g solutions equals: { #e } modulo: #asOrderedCollection
]

{ #category : #tests }
GoalTest >> testBagOf [

	| g |
	g := [ :list | 
	     [ :mother :child :cdr :cddr | 
	     | bagOfGoal |
	     bagOfGoal := (Goal bagOfo
		                   value:
			                   (DescendTestPredicate value: mother value: child)
		                   value: child
		                   value: cddr)
		                  variables: (Array with: mother);
		                  yourself.

	     bagOfGoal
	     , (sexpTheory conso value: mother value: cdr value: list)
	     , (sexpTheory conso value: child value: cddr value: cdr) ] asGoal ]
		     asGoal.
	self
		assert: g solutions
		equals: { 
				(#laura cons: (0 asReifiedVar cons: #( #rose ) asCons)).
				(#charlotte cons:
					 (0 asReifiedVar cons: #( #caroline #laura #rose ) asCons)).
				(#martha cons:
					 (0 asReifiedVar cons:
						  #( #charlotte #caroline #laura #rose ) asCons)).
				(#caroline cons: (0 asReifiedVar cons: #( #laura #rose ) asCons)) }
		modulo: #asOrderedCollection.

	g := [ :list | 
	     [ :mother :child | 
	     (Goal bagOfo
		      value: (DescendTestPredicate value: mother value: child)
		      value: child
		      value: list)
		     variables: {  };
		     yourself ] asGoal ] asGoal.
	self
		assert: g solutions
		equals:
			#( #charlotte #rose #laura #caroline #rose #caroline #laura #laura
			   #rose #rose ) asCons
		modulo: #asOrderedCollection.

	g := [ :list | 
	     [ :groups | 
	     | bagOfGoal |
	     bagOfGoal := [ :mother :child | 
	                  (Goal bagOfo
		                   value:
			                   (DescendTestPredicate value: mother value: child)
		                   value: child
		                   value: groups)
		                  variables: (Array with: mother);
		                  yourself ] asGoal.
	     Goal findAllo value: bagOfGoal value: groups value: list ] asGoal ]
		     asGoal.
	self
		assert: g solutions
		equals: (#( #( #( #rose ) #( #caroline #laura #rose )
			       #( #charlotte #caroline #laura #rose )
			       #( #laura #rose ) ) ) collect: #asCons)
		modulo: #asOrderedCollection.
	g := [ :list | 
	     [ :groups :mother :child | 
	     | nested |
	     nested := (Goal bagOfo
		                value:
			                (DescendTestPredicate value: mother value: child)
		                value: child
		                value: groups)
		               variables: (Array with: mother);
		               yourself.
	     (Goal bagOfo value: nested value: groups value: list)
		     variables: {  };
		     yourself ] asGoal ] asGoal.
	self
		assert: g solutions
		equals: (#( #( #( #rose ) #( #caroline #laura #rose )
			       #( #charlotte #caroline #laura #rose )
			       #( #laura #rose ) ) ) collect: #asCons)
		modulo: #asOrderedCollection.

	g := [ :list | 
	     [ :a :b :c | 
	     (Goal bagOfo
		      value: (MKPredicateFooForBag value: a value: b value: c)
		      value: c
		      value: list)
		     variables: (Array with: a with: b);
		     yourself ] asGoal ] asGoal.
	self
		assert: g solutions
		equals: ({ 
				 #( #c #d ).
				 #( #g ).
				 #( #f #e ) } collect: #asCons)
		modulo: #asOrderedCollection.

	g := [ :list | 
	     [ :a :b :c | 
	     (Goal bagOfo
		      value: (MKPredicateFooForBag value: a value: b value: c)
		      value: c
		      value: list)
		     variables: { 
				     a.
				     b.
				     c };
		     yourself ] asGoal ] asGoal.
	self
		assert: g solutions
		equals: { 
				#( #e ) asCons.
				#( #c ) asCons.
				#( #f ) asCons.
				#( #d ) asCons.
				#( #g ) asCons }
		modulo: #asOrderedCollection
]

{ #category : #tests }
GoalTest >> testCaro [

	| g µ |
	µ := Theory sexp.
	g := [ :r | µ caro value: 'acorn' asCons value: r ] asGoal.
	self assert: g solutions equals: { $a } modulo: #asOrderedCollection.
	g := [ :r | 
	     [ :x :y | 
	     (µ caro value: { #grape. #raisin. #pear } asCons value: x)
	     , (µ caro
			      value: { 
					      (#a cons: nil).
					      (#b cons: nil).
					      (#c cons: nil) } asCons
			      value: y) , (µ conso value: x value: y value: r) ] asGoal ]
		     asGoal.
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
	     [ :d | 
	     (µ cdro value: 'acorn' asCons value: d)
	     , (µ caro value: d value: r) ] asGoal ] asGoal.
	self assert: g solutions equals: { $c } modulo: #asOrderedCollection.
	g := [ :r | 
	     [ :x :y | 
	     (µ cdro value: { #grape. #raisin. #pear } asCons value: x)
	     , (µ caro
			      value: { 
					      (#a cons: nil).
					      (#b cons: nil).
					      (#c cons: nil) } asCons
			      value: y) , (µ conso value: x value: y value: r) ] asGoal ]
		     asGoal.
	self
		assert: g solutions
		equals: { { 
				{ #raisin. #pear }.
				#a } asCons }
		modulo: #asOrderedCollection.
	g := [ µ cdro value: 'acorn' asCons value: 'corn' asCons ] asGoal.
	self
		assert: g solutions
		equals: { Var tautology }
		modulo: #asOrderedCollection.
	g := [ :r | µ cdro value: 'acorn' asCons value: 'acorn' asCons ]
		     asGoal.
	self assert: g solutions readStream upToEnd isEmpty.
	g := [ :r | 
	     µ cdro value: 'corn' asCons value: { 
			     r.
			     $r.
			     $n } asCons ] asGoal.
	self assert: g solutions equals: { $o } modulo: #asOrderedCollection.
	g := [ :l | 
	     [ :x | 
	     (µ caro value: l value: $a)
	     , (µ cdro value: l value: 'corn' asCons) ] asGoal ] asGoal.
	self
		assert: g solutions
		equals: { 'acorn' asCons }
		modulo: #asOrderedCollection
]

{ #category : #tests }
GoalTest >> testConde [

	| g |
	g := (LinkedList new
		      add: false asGoal -> true asGoal;
		      yourself) cond e.
	self assert: g solutions readStream upToEnd isEmpty.
	g := (LinkedList new
		      add: false asGoal -> false asGoal;
		      add: true asGoal -> true asGoal;
		      yourself) cond e.
	self
		assert: g solutions
		equals: { Var tautology }
		modulo: #asOrderedCollection.
	g := [ :x | 
	     (LinkedList new
		      add: (x unifyo value: #olive) -> true asGoal;
		      add: (x unifyo value: #apple) -> false asGoal;
		      add: (x unifyo value: #oil) -> true asGoal;
		      yourself) cond e ] asGoal.
	self
		assert: g solutions
		equals: { #olive. #oil }
		modulo: #asOrderedCollection.
	g := [ :x | 
	     (LinkedList new
		      add: (x unifyo value: #olive) -> true asGoal;
		      add: (x unifyo value: #apple) -> false asGoal;
		      add: (x unifyo value: #oil) -> true asGoal;
		      yourself) cond e ] asGoal.
	self
		assert: (g solutions next: 1)
		equals: { #olive }
		modulo: #asOrderedCollection.
	g := [ :x :y | 
	     (LinkedList new
		      add: (x unifyo value: #split) -> (y unifyo value: #pea);
		      add: (x unifyo value: #navy) -> (y unifyo value: #bean);
		      yourself) cond e ] asGoal.
	self
		assert: g solutions
		equals: (Array with: { #split. #pea } with: { #navy. #bean })
		modulo: #asOrderedCollection.
	g := [ :x :y | 
	     Goal cond e
		     if: (self teacup: x) , (y unifyo value: true)
		     then: true asGoal;
		     if: (x unifyo value: true) then: (y unifyo value: false);
		     if: true asGoal then: true asGoal;
		     yourself ] asGoal.
	self
		assert: g solutions
		equals: (Array
				 with: { true. false }
				 with: { 
						 0 asReifiedVar.
						 1 asReifiedVar }
				 with: { #tea. true }
				 with: { #cup. true })
		modulo: #asOrderedCollection.
	g := [ :x | 
	     (LinkedList new
		      add: (x unifyo value: #olive) -> true asGoal;
		      add: (x unifyo value: 5) -> (self fives: x);
		      add: (x unifyo value: #oil) -> true asGoal;
		      yourself) cond e ] asGoal.
	self
		assert: (g solutions next: 10)
		equals: { #olive. 5. #oil. 5. 5. 5. 5. 5. 5. 5 }
		modulo: #asOrderedCollection.
	g := [ :x | 
	     (LinkedList new
		      add: (x unifyo value: #olive) -> true asGoal;
		      add: (self fives: x) -> false asGoal;
		      add: (x unifyo value: #oil) -> true asGoal;
		      yourself) cond e
	     "this line makes cond a divergent goal" ] asGoal
	"self
	assert: (g solutions next: 10)
	equals: {#olive . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5}"
]

{ #category : #tests }
GoalTest >> testConjDisj [

	| g |
	g := [ :a | 
	     (3 unifyo value: a) , (4 unifyo value: a) | (a unifyo value: 0) ]
		     asGoal.
	self assert: g solutions equals: { 0 } modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testConjFailingSharing [

	| g |
	g := [ :x :y :z | 
	     (3 unifyo value: x) , (z unifyo value: x) , (z unifyo value: 4) ]
		     asGoal.
	self assert: g solutions equals: #(  ) modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testConjFalseThreeWithVar [

	| g |
	g := [ :q | false asGoal , (3 unifyo value: q) ] asGoal.
	self assert: g solutions readStream upToEnd isEmpty.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testConjSucceedingSharing [

	| g |
	g := [ :z | 
	     [ :x | (3 unifyo value: x) , (z unifyo value: x) ] asGoal ]
		     asGoal.
	self assert: g solutions equals: #( 3 ) modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testConjSymmetry [

	| g |
	g := [ :a | (a unifyo value: 4) , (4 unifyo value: a) ] asGoal.
	self assert: g solutions equals: { 4 } modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testConjThreeFour [

	| g |
	g := [ :a | (3 unifyo value: a) , (4 unifyo value: a) ] asGoal.
	self assert: g solutions readStream upToEnd isEmpty.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testConjThreeFourWithTwoVars [

	| g |
	g := [ :a :b | (3 unifyo value: a) , (4 unifyo value: b) ] asGoal.
	self
		assert: g solutions
		equals: { { 3. 4 } }
		modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testConjThreeFresh [

	| g |
	g := [ :a | (3 unifyo value: a) , [ :b | 4 unifyo value: b ] asGoal ]
		     asGoal.
	self assert: g solutions equals: { 3 } modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testConjTrueThreeWithThree [

	| g |
	g := [ :q | true asGoal , (3 unifyo value: 3) ] asGoal.
	self
		assert: g solutions
		equals: { 0 asReifiedVar }
		modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testConjTrueTrue [

	| g |
	g := true asGoal , true asGoal.
	self
		assert: g solutions
		equals: { Var tautology }
		modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
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
		asGoal.
	self
		assert: g solutions
		equals:
			{{{$a . $b . $c}.
			$d.
			$e} asCons}
		modulo: #asOrderedCollection.
	g := [ :l | µ conso value: #(#a #b #c) asCons value: #(#(#d #e)) asCons value: l ]
		asGoal.
	self
		assert: g solutions
		equals: {#(#(#a #b #c) #(#d #e)) asCons}
		modulo: #asOrderedCollection.
	g := [ :l | 
	µ conso
		value: l
		value: #(#b #c #d) asCons
		value: #(#a #b #c #d) asCons ] asGoal.
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
				value: l) ] asGoal ] asGoal.
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
		     asGoal.
	self
		assert: g solutions
		equals: #( #( 1 1 ) #( 1 3 ) #( 1 2 ) )
		modulo: #asOrderedCollection
]

{ #category : #tests }
GoalTest >> testCutAndFail [

	"From https://stackoverflow.com/questions/15138706/cut-and-fail-in-prolog
	
	 a(X) :- b(X),!,c(X),fail.
	 a(X) :- d(X).
	 b(1).
	 b(4).
	 c(1).
	 c(3).
	 d(4)."

	| g |
	g := [ :x | 
	     (x unifyo value: 1) | (x unifyo value: 4) | (x unifyo value: 4)
	     ! ((x unifyo value: 1) | (x unifyo value: 3) , false asGoal) ]
		     asGoal.
	self assert: g solutions equals: #(  ) modulo: #asOrderedCollection.

	g := [ :x | 
	     (x unifyo value: 1) | (x unifyo value: 4) | (x unifyo value: 4)
	     ! ((x unifyo value: 1) | (x unifyo value: 3)) ] asGoal.
	self assert: g solutions equals: #( 1 ) modulo: #asOrderedCollection.

	g := [ :x | 
	     (x unifyo value: 1) | (x unifyo value: 4)
	     , ((x unifyo value: 1) | (x unifyo value: 3)) , false asGoal
	     | (x unifyo value: 4) ] asGoal.
	self assert: g solutions equals: #( 4 ) modulo: #asOrderedCollection.

	g := [ :x | 
	     (x unifyo value: 1) | (x unifyo value: 4)
	     , ((x unifyo value: 1) | (x unifyo value: 3)) , false asGoal
	     | (x unifyo value: 4) ! true asGoal ] asGoal.
	self assert: g solutions equals: #( 4 ) modulo: #asOrderedCollection
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
	     ! (x unifyo value: 3) ] asGoal.
	self assert: g solutions equals: #(  ) modulo: #asOrderedCollection
]

{ #category : #tests }
GoalTest >> testCutUnifyThenFail [

	| g |
	g := [ :x | 
	     (x unifyo value: 1) | (x unifyo value: 2) | (x unifyo value: 3)
	     ! (x unifyo value: 2) ] asGoal.
	self assert: g solutions equals: #(  ) modulo: #asOrderedCollection.
	g := [ :x | 
	     (x unifyo value: 1) | (x unifyo value: 2) | (x unifyo value: 3)
	     , (x unifyo value: 2) ] asGoal.
	self assert: g solutions equals: #( 2 ) modulo: #asOrderedCollection
]

{ #category : #tests }
GoalTest >> testDisjFalseFalse [

	| g |
	g := false asGoal | false asGoal.
	self assert: g solutions equals: #(  ) modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testDisjFalseTrue [

	| g |
	g := false asGoal | true asGoal.
	self
		assert: g solutions
		equals: { Var tautology }
		modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testDisjFourWithVarOrThreeWithVar [

	| g |
	g := [ :a | (4 unifyo value: a) | (3 unifyo value: a) ] asGoal.
	self
		assert: g solutions
		equals: { 4. 3 }
		modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testDisjThreeFourThenFive [

	| g |
	g := [ :a | 
	     (3 unifyo value: a) | (4 unifyo value: a) | (5 unifyo value: a) ]
		     asGoal.
	self
		assert: g solutions
		equals: { 3. 4. 5 }
		modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testDisjThreeThenFourFive [

	| g |
	g := [ :a | 
	     (3 unifyo value: a)
	     | ((4 unifyo value: a) | (5 unifyo value: a)) ] asGoal.
	self
		assert: g solutions
		equals: { 3. 4. 5 }
		modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testDisjThreeWithThreeOrFourWithVar [

	| g |
	g := [ :a | (3 unifyo value: 3) | (4 unifyo value: a) ] asGoal.
	self
		assert: g solutions
		equals: { 
				0 asReifiedVar.
				4 }
		modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testDisjThreeWithVarOrFourWithVar [

	| g |
	g := [ :a | (3 unifyo value: a) | (4 unifyo value: a) ] asGoal.
	self
		assert: g solutions
		equals: { 3. 4 }
		modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testDisjThreeWithVarOrThreeWithVar [

	| g |
	g := [ :a | (3 unifyo value: a) | (3 unifyo value: a) ] asGoal.
	self
		assert: g solutions
		equals: { 3. 3 }
		modulo: #asOrderedCollection.
		
	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testDisjTrueTrue [

	| g |
	g := true asGoal | true asGoal.
	self
		assert: g solutions
		equals: { 
				Var tautology.
				Var tautology }
		modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testEtaRaw [

	| g |
	g := self eternity: Object new.
	self assert: g class equals: Eta
]

{ #category : #tests }
GoalTest >> testFailed [

	| g |
	g := false asGoal.
	self assert: g solutions equals: #(  ) modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testFindAll [

	| g |
	g := [ :b | DescendTestPredicate value: #martha value: b ] asGoal.
	self
		assert: g solutions
		equals: #( charlotte caroline laura rose )
		modulo: #asOrderedCollection.

	g := [ :list | 
	     [ :b | 
	     Goal findAllo
		     value: (DescendTestPredicate value: #martha value: b)
		     value: (Array with: #fromMartha with: b) asCons
		     value: list ] asGoal ] asGoal.
	self
		assert: g solutions
		equals:
			(#( #( #( #fromMartha #charlotte ) #( #fromMartha #caroline )
			       #( #fromMartha #laura ) #( #fromMartha #rose ) ) ) collect:
				 #asCons)
		modulo: #asOrderedCollection.

	g := [ :list | 
	     [ :b :y | 
	     Goal findAllo
		     value: (DescendTestPredicate value: #martha value: b)
		     value: y
		     value: list ] asGoal ] asGoal.
	self
		assert: g solutions
		equals: { { 
				0 asReifiedVar.
				0 asReifiedVar.
				0 asReifiedVar.
				0 asReifiedVar } asCons }
		modulo: #asOrderedCollection.

	g := [ :list | 
	     [ :b :cdr | 
	     (Goal findAllo
		      value: (DescendTestPredicate value: #mary value: b)
		      value: b
		      value: cdr)
	     , (sexpTheory conso value: #empty value: cdr value: list) ]
		     asGoal ] asGoal.
	self
		assert: g solutions
		equals: #( empty ) asCons
		modulo: #asOrderedCollection.

	g := [ :list | 
	     [ :mother :child | 
	     Goal findAllo
		     value: (DescendTestPredicate value: mother value: child)
		     value: child
		     value: list ] asGoal ] asGoal.
	self
		assert: g solutions
		equals:
			{ #( #charlotte #rose #laura #caroline #rose #caroline #laura
			   #laura #rose #rose ) asCons }
		modulo: #asOrderedCollection.

	g := [ :list | 
	     [ :a :b :c | 
	     Goal findAllo
		     value: (MKPredicateFooForBag value: a value: b value: c)
		     value: c
		     value: list ] asGoal ] asGoal.
	self
		assert: g solutions
		equals: { #( #c #g #f #e #d ) asCons }
		modulo: #asOrderedCollection.

	g := [ :list | 
	     [ :a :b :c | 
	     (Goal bagOfo
		      value: (MKPredicateFooForBag value: a value: b value: c)
		      value: c
		      value: list)
		     variables: {  };
		     yourself ] asGoal ] asGoal.
	self
		assert: g solutions
		equals: { #( #c #g #f #e #d ) asCons }
		modulo: #asOrderedCollection
]

{ #category : #tests }
GoalTest >> testFives [

	| g |
	g := [ :x | self fives: x ] asGoal.
	self
		assert: (g solutions next: 10)
		equals: { 5. 5. 5. 5. 5. 5. 5. 5. 5. 5 }
		modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: 10
]

{ #category : #tests }
GoalTest >> testFivesByNats [

	| g |
	g := [ :x | self repeat: x value: 5 ] asGoal.
	self
		assert: (g solutions next: 10)
		equals: { 5. 5. 5. 5. 5. 5. 5. 5. 5. 5 }
		modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: 10
]

{ #category : #tests }
GoalTest >> testFivesByPredicate [

	| g |
	g := [ :r | MKPredicateFives value: r ] asGoal.
	self
		assert: (g solutions next: 10)
		equals: { 5. 5. 5. 5. 5. 5. 5. 5. 5. 5 }
		modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: 10
]

{ #category : #tests }
GoalTest >> testFivesSwapped [

	| g |
	g := [ :x | self swappedfives: x ] asGoal.
	self
		assert: (g solutions next: 10)
		equals: { 5. 5. 5. 5. 5. 5. 5. 5. 5. 5 }
		modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: 10
]

{ #category : #tests }
GoalTest >> testFreshFailed [

	| g |
	g := [ :q | false asGoal ] asGoal.
	self assert: g solutions equals: #(  ) modulo: #asOrderedCollection. " #()"

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testFreshMultipleVars [

	| g |
	g := [ :q :r | true asGoal ] asGoal.
	self
		assert: g solutions
		equals: (Array with: { 
					 0 asReifiedVar.
					 1 asReifiedVar })
		modulo: #asOrderedCollection. " an Array(an Array(•₀ •₁))"

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testFreshSucceed [

	| g |
	g := [ :q | true asGoal ] asGoal.
	self
		assert: g solutions
		equals: { 0 asReifiedVar }
		modulo: #asOrderedCollection. " an Array(•₀)"

	^ self exportComputationTreeOfGoal: g limitedTo: -1
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
	g := [ :n | µ lengtho value: {#anElement} asCons value: n ] asGoal.
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
			3 asConsedBinaryRepr} ] asGoal.
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
			n} ] asGoal.
	self
		assert: (g solutions next: 1)
		equals: {10 asConsedBinaryRepr}
		modulo: #asOrderedCollection
]

{ #category : #tests }
GoalTest >> testListo [

	| g |
	g := [ :r | 
	     MKPredicateSexpListo value: { 
			     $a.
			     $b.
			     r.
			     $d } asCons ] asGoal.
	self
		assert: g solutions
		equals: { 0 asReifiedVar }
		modulo: #asOrderedCollection. " an Array(•₀)"
	g := [ :r | 
	     MKPredicateSexpListo value: ({ $a. $b. $c } asConsWithCdr: r) ]
		     asGoal.
	self
		assert: (g solutions next: 5)
		equals: ((0 to: 4) collect: [ :each | 
				 ((0 to: each - 1) collect: [ :i | i asReifiedVar ]) asCons ])
		modulo: #asOrderedCollection " an Array(nil (•₀) (•₀ •₁) (•₀ •₁ •₂) (•₀ •₁ •₂ •₃))"
]

{ #category : #tests }
GoalTest >> testLolo [

	| g |
	g := [ :r | MKPredicateSexpLolo value: r ] asGoal.
	self
		assert: (g solutions next: 1)
		equals: { nil asCons }
		modulo: #asOrderedCollection.
	g := [ 
	     [ :x :y | 
	     MKPredicateSexpLolo value: { 
			     #( a b ).
			     { 
				     x.
				     $c }.
			     { 
				     $d.
				     y } } asCons ] asGoal ] asGoal.
	self
		assert: (g solutions next: 1)
		equals: { Var tautology }
		modulo: #asOrderedCollection.
	g := [ 
	     [ :x | 
	     MKPredicateSexpLolo value: ({ #( a b ) } asConsWithCdr: x) ]
		     asGoal ] asGoal.
	self
		assert: (g solutions next: 1)
		equals: { Var tautology }
		modulo: #asOrderedCollection.
	g := [ :x | 
	     MKPredicateSexpLolo value: ({ 
			      #( a b ).
			      #( c d ) } asConsWithCdr: x) ] asGoal.
	self
		assert: (g solutions next: 5)
		equals: { 
				nil.
				(nil cons: nil).
				{ nil. nil } asCons.
				{ (0 asReifiedVar cons: nil) } asCons.
				{ nil. nil. nil } asCons }
		modulo: #asOrderedCollection " an Array((nil (nil) (nil nil) ((•₀)) (nil nil nil)))"
]

{ #category : #tests }
GoalTest >> testNats [

	| g M |
	M := 1000.
	g := [ :x | self nats: x ] asGoal.
	self
		assert: (g solutions next: M)
		equals: (0 to: M - 1)
		modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: 10
]

{ #category : #tests }
GoalTest >> testSucceed [

	| g |
	g := true asGoal.

	self
		assert: g solutions
		equals: { Var tautology }
		modulo: #asOrderedCollection. " #(#tautology)"

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testSucceedInvariant [

	CTSBRAL new asState in: [ :s |
		| ss |
		ss := true asGoal onState: s.
		self assert: ss car equals: s ].
	CTSBRAL new asState in: [ :s |
		| ss |
		ss := s srfi41Singleton
			      zip: (true asGoal onState: s)
			      with: [ :a :b | a == b ].
		self assert: ss equals: { true } modulo: #asOrderedCollection ]
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
	g := [ :x | patho value: #a value: x ] asGoal.
	self assert: g solutions contents equals: #(#b #a #d).
	patho := self
		patho:
			{(#a -> #b).
			(#b -> #c).
			(#c -> #d).
			(#d -> #a).
			(#d -> #b)} asGraph asGoal.
	g := [ :x | patho value: #c value: x ] asGoal.
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
		if: true asGoal then: (fº value: y) ] asGoal.
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
		equals: [ :q | fº value: q ] asGoal solutions contents.
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
		equals: [ :q | fº value: q ] asGoal solutions contents
]

{ #category : #tests }
GoalTest >> testTeaCup [

	| g |
	g := [ :x | self teacup: x ] asGoal.
	self
		assert: g solutions
		equals: { #tea. #cup }
		modulo: #asOrderedCollection.
	g := [ :x :y :z | 
	     (self teacup: x) , ((self teacup: y) , (self teacup: z)) ]
		     asGoal.
	self
		assert: g solutions
		equals:
			#( #( #tea #tea #tea ) #( #tea #tea #cup ) #( #tea #cup #tea )
			   #( #tea #cup #cup ) #( #cup #tea #tea ) #( #cup #tea #cup )
			   #( #cup #cup #tea ) #( #cup #cup #cup ) )
		modulo: #asOrderedCollection
]

{ #category : #tests }
GoalTest >> testUnifyFourWithThree [

	| g |
	g := 4 unifyo value: 3.
	self assert: g solutions equals: #(  ) modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testUnifySharing [

	| g |
	g := [ :r | 
	     [ :x | (r unifyo value: x) , (x unifyo value: true) ] asGoal ]
		     asGoal.
	self
		assert: g solutions
		equals: { true }
		modulo: #asOrderedCollection. " #(true)"

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testUnifySymmetryFourWithVar [

	| g |
	g := [ :q | 4 unifyo value: q ] asGoal.
	self assert: g solutions equals: { 4 } modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testUnifySymmetryVarWithFour [

	| g |
	g := [ :q | q unifyo value: 4 ] asGoal.
	self assert: g solutions equals: { 4 } modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testUnifyThreeWithThree [

	| g |
	g := 3 unifyo value: 3.
	self
		assert: g solutions
		equals: { Var tautology }
		modulo: #asOrderedCollection.

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testUnifyWithTopmostSharing [

	| g |
	g := [ :r | 
	     [ :x :y | r unifyo value: (Array with: x with: y) asCons ] asGoal ]
		     asGoal.
	self
		assert: g solutions
		equals: { 
				0 asReifiedVar.
				1 asReifiedVar } asCons
		modulo: #asOrderedCollection. " (•₀ •₁)"

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testUnifyWithTopmostSharingWithRepetition [

	| g |
	g := [ :r | 
	     [ :x :y | 
	     (LinkedList
		      with: x
		      with: y
		      with: x
		      with: y) asCons unifyo value: r ] asGoal ] asGoal.
	self
		assert: g solutions
		equals: { 
				0 asReifiedVar.
				1 asReifiedVar.
				0 asReifiedVar.
				1 asReifiedVar } asCons
		modulo: #asOrderedCollection. " (•₀ •₁ •₀ •₁)"

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]

{ #category : #tests }
GoalTest >> testUnifyWithTopmostWithoutSharing [

	| g |
	g := [ :r | 
	     [ :x :y | 
	     (LinkedList with: x with: r) asCons unifyo value:
		     (LinkedList with: 1 with: y) asCons ] asGoal ] asGoal.
	self
		assert: g solutions
		equals: { 0 asReifiedVar }
		modulo: #asOrderedCollection. " an Array(•₀)"

	^ self exportComputationTreeOfGoal: g limitedTo: -1
]
