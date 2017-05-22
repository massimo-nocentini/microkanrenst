as yet unclassified
testSucceed
	"a succeessful relation always produces a tautology"

	self assert: true asGoal solutions all equals: (LinkedList with: Var tautology)