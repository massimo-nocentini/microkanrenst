as yet unclassified
testUnify
	| g |
	g := 3 unifyo value: 3.
	self assert: g solutions contents equals: {Var tautology}.
	g := 4 unifyo value: 3.
	self assert: g solutions contents equals: {}.
	"symmetry"
	g := [:q | 4 unifyo value: q] fresh.
	self assert: g solutions contents equals: {4}.
	g := [:q | q unifyo value: 4] fresh.
	self assert: g solutions contents equals: {4}.
	"reification"
	g := [:q | true asGoal] fresh.
	self assert: g solutions contents equals: {0 asReifiedVar}.
	g := [:q :r | true asGoal] fresh.
	self
		assert: g solutions contents
		equals: (Array with: {0 asReifiedVar. 1 asReifiedVar}).
	g := [:r | [:x :y | r
				unifyo value: (Array with: x with: y)] fresh] fresh.
	self
		assert: g solutions contents
		equals: (Array with: {0 asReifiedVar. 1 asReifiedVar}).
	g := [:r | [:x :y | r
				unifyo value: (LinkedList with: x with: y)] fresh] fresh.
	self
		assert: g solutions contents
		equals: (Array with: {0 asReifiedVar. 1 asReifiedVar}).
	g := [:r | [:x :y | (LinkedList with: x with: y)
				unifyo value: r] fresh] fresh.
	self
		assert: g solutions contents
		equals: (Array with: {0 asReifiedVar. 1 asReifiedVar}).
	g := [:r | [:x :y | (LinkedList
				with: x
				with: y
				with: x
				with: y)
				unifyo value: r] fresh] fresh.
	self
		assert: g solutions contents
		equals: (Array with: {0 asReifiedVar. 1 asReifiedVar. 0 asReifiedVar. 1 asReifiedVar}).
	g := [:r | [:x :y | (LinkedList with: x with: r)
				unifyo value: (LinkedList with: 1 with: y)] fresh].
	self assert: g fresh solutions contents equals: {0 asReifiedVar}.
	"sharing"
	g := [:r | [:x | (r unifyo value: x)
				, (x unifyo value: true)] fresh].
	self assert: g fresh solutions contents equals: {true}