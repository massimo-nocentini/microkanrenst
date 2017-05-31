as yet unclassified
testConde
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
		assert: (g solutions atMost: 10)
		equals: {#olive . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5 . 5}"