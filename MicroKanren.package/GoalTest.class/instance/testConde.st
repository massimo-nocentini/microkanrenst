as yet unclassified
testConde
	| g |
	g := (LinkedList new add: false asGoal -> true asGoal;
				 yourself) cond e .
	self assert: g solutions contents equals: {}.
	g := (LinkedList new add: false asGoal -> false asGoal; add: true asGoal -> true asGoal;
				 yourself) cond e .
	self assert: g solutions contents equals: {Var tautology}.
	g := [:x | (LinkedList new add:( x unifyo value: #olive) -> true asGoal;
				 add: (x unifyo value: #apple) -> false asGoal;
				 add:( x unifyo value: #oil) -> true asGoal;
				 yourself) cond e] fresh.
	self assert: g solutions contents equals: {#olive. #oil}.
	g := [:x | (LinkedList new add:( x unifyo value: #olive) -> true asGoal;
				 add: (x unifyo value: #apple) -> false asGoal;
				 add: (x unifyo value: #oil) -> true asGoal;
				 yourself) cond e] fresh.
	self assert: (g solutions next: 1) contents equals: {#olive}.
	g := [:x :y | (LinkedList new add: (x unifyo value: #split) -> (y unifyo value: #pea);
				 add: (x unifyo value: #navy) -> (y unifyo value: #bean);
				 yourself) cond e] fresh.
	self
		assert: g solutions contents
		equals: (Array with: {#split. #pea} with: {#navy. #bean}).
	g := [:x :y | Goal cond e if: (self teacup: x)
					, (y unifyo value: true) then: true asGoal;
				 if: (x unifyo value: true) then: (y unifyo value: false);
				 if: true asGoal then: true asGoal] fresh.
	self
		assert: g solutions contents
		equals: (Array
				with: {#tea. true}
				with: {#cup. true}
				with: {true. false}
				with: {0 asReifiedVar. 1 asReifiedVar}).
	g := [:x | (LinkedList new add: (x unifyo value: #olive) -> true asGoal;
				 add: (x unifyo value: 5)
					-> (self fives: x);
				 add: (x unifyo value: #oil) -> true asGoal;
				 yourself) cond e] fresh.
	self assert: (g solutions next: 10) contents equals: {#olive. 5. 5. 5. 5. 5. 5. 5. 5. 5}.
	g := [:x | (LinkedList new add: (x unifyo value: #olive)
					-> true asGoal;
				 add: (self fives: x)
					-> false asGoal;
				 add: (x unifyo value: #oil)
					-> true asGoal;
				 yourself) cond e
			"this line makes cond a divergent goal"] fresh
	"self
	assert: (g solutions next: 10)
	equals: {#olive . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5}"