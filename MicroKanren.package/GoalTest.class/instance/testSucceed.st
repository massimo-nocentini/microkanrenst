as yet unclassified
testSucceed
	"A relation that can *always* be satisfied, regardless of free
	variables that appear in it, is called _tautology_."
	self assert: true asGoal solutions all equals: {Var tautology}.
	self assert: (true asGoal | false asGoal) solutions all equals: {Var tautology.}.
	self assert: (true asGoal | true asGoal) solutions all equals: {Var tautology. Var tautology}.
	self assert: (true asGoal , true asGoal) solutions all equals: {Var tautology}