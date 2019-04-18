tests
testSimpleRules
	| g |
	g := self mcculloch proves: #(2 3) asCons relates: #(3) asCons.
	self assert: g solutions contents equals: {Var tautology}.
	g := self mcculloch proves: #(3 2 4 2) asCons relates: #(4 2 2 4 2) asCons.
	self assert: g solutions contents equals: {Var tautology}.
	g := self mcculloch proves: #(3 4 2) asCons relates: #(4 2 2 4 2) asCons.
	self assert: g solutions contents equals: {}