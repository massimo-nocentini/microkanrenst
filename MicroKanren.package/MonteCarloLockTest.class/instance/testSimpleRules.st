tests
testSimpleRules
	| g µ|
	µ := Theory montecarloLock.
	g := µ mccullocho value: #(2 3) asCons value: #(3) asCons.
	self assert: g solutions contents equals: {Var tautology}.
	g := µ mccullocho value: #(3 2 4 2) asCons value: #(4 2 2 4 2) asCons.
	self assert: g solutions contents equals: {Var tautology}.
	g := µ mccullocho value: #(3 4 2) asCons value: #(4 2 2 4 2) asCons.
	self assert: g solutions contents equals: {}