as yet unclassified
testAlphaRuleo
	| g µ |
	µ := Theory sexp.
	g := [:x :y | µ alphaRuleo value: x value: y] fresh.
	self assert: g solutions contents equals: {}.
	g := [[:x :y | (x unifyo value: 3) , (y unifyo value: 3)
				, (µ alphaRuleo value: x value: y)] fresh] eta.
	self assert: g solutions contents equals: {Var tautology}.
	g := [[:x :y | (x unifyo value: 3) , (y unifyo value: 4)
				, (µ alphaRuleo value: x value: y)] fresh] eta.
	self assert: g solutions contents equals: {}.
	g := [:x :y | (x unifyo value: y)
				, (µ alphaRuleo value: x value: y)] fresh.
	self assert: g solutions contents equals: {{0 asReifiedVar. 0 asReifiedVar}}.
	g := [:x :y | (µ alphaRuleo value: x value: y)
				, (x unifyo value: y)] fresh.
	self assert: g solutions contents equals: {}
	"alphaRuleo is an impure operator."