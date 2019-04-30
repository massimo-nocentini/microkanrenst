as yet unclassified
testConde
	| g |
	g := (LinkedList new add: false asGoal -> true asGoal;
				 yourself) cond e .
	self assert: g solutions contents equals: {}.
	g := (LinkedList new add: false asGoal -> false asGoal; add: true asGoal -> true asGoal;
				 yourself) cond e .
	self assert: g solutions contents equals: {Var tautology}.
	g := [:x | (LinkedList new add: x =° #olive -> true asGoal;
				 add: x =° #apple -> false asGoal;
				 add: x =° #oil -> true asGoal;
				 yourself) cond e] fresh.
	self assert: g solutions contents equals: {#olive. #oil}.
	g := [:x | (LinkedList new add: x =° #olive -> true asGoal;
				 add: x =° #apple -> false asGoal;
				 add: x =° #oil -> true asGoal;
				 yourself) cond e] fresh.
	self assert: (g solutions next: 1) contents equals: {#olive}.
	g := [:x :y | (LinkedList new add: x =° #split -> (y =° #pea);
				 add: x =° #navy -> (y =° #bean);
				 yourself) cond e] fresh.
	self
		assert: g solutions contents
		equals: (Array with: {#split. #pea} with: {#navy. #bean}).
	g := [:x :y | Goal cond e if: (self teacup: x)
					, (y =° true) then: true asGoal;
				 if: x =° true then: y =° false;
				 if: true asGoal then: true asGoal] fresh.
	self
		assert: g solutions contents
		equals: (Array
				with: {#tea. true}
				with: {#cup. true}
				with: {true. false}
				with: {0 asReifiedVar. 1 asReifiedVar}).
	g := [:x | (LinkedList new add: x =° #olive -> true asGoal;
				 add: x =° 5
					-> (self fives: x);
				 add: x =° #oil -> true asGoal;
				 yourself) cond e] fresh.
	self assert: (g solutions next: 10) contents equals: {#olive. 5. 5. 5. 5. 5. 5. 5. 5. 5}.
	g := [:x | (LinkedList new add: (x =° #olive)
					-> true asGoal;
				 add: (self fives: x)
					-> false asGoal;
				 add: (x =° #oil)
					-> true asGoal;
				 yourself) cond e
			"this line makes cond a divergent goal"] fresh
	"self
	assert: (g solutions next: 10)
	equals: {#olive . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5}"