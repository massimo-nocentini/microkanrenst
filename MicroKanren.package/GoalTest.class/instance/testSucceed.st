as yet unclassified
testSucceed
	"a succeessful relation always produces a tautology"

	self assert: true asGoal solutions all equals: {Var tautology}.
	self
		assert: (true asGoal | true asGoal) solutions all
		equals:
			{Var tautology.
			Var tautology}.
	self assert: (true asGoal , true asGoal) solutions all equals: {Var tautology}