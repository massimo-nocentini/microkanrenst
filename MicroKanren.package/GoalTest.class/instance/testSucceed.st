as yet unclassified
testSucceed
	"a succeessful relation always produces a tautology"

	self assert: Goal succeed solutions all equals: (LinkedList with: Var tautology)